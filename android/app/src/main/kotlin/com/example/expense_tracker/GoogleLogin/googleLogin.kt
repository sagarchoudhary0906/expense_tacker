package com.example.expense_tracker
// The Kotlin package; must match your app’s package/namespace so this class
// can be imported from the rest of your Android code.

import android.app.Activity              // Android Activity reference
import android.util.Log                 // Android logging
import androidx.credentials.CredentialManager
// Credential Manager entry point that orchestrates credential flows

import androidx.credentials.CustomCredential
// Base type for credentials returned by CredentialManager; Google ID token
// comes back wrapped as a CustomCredential with a specific type.

import androidx.credentials.GetCredentialRequest
// The request object describing what kinds of credentials we want (Google, passkeys, etc.)

import androidx.credentials.exceptions.GetCredentialCancellationException
import androidx.credentials.exceptions.GetCredentialException
import androidx.credentials.exceptions.NoCredentialException
// Exceptions thrown by the Credential Manager flow. We handle these to send
// clean errors back to Flutter.

import com.google.android.libraries.identity.googleid.GetGoogleIdOption
// Google Identity Services: describes the “Sign in with Google” option for CM.

import com.google.android.libraries.identity.googleid.GoogleIdTokenCredential
// Google Identity Services: parses the returned Google ID token credential.

import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
// Flutter’s bridge to get the current Activity (for Android UI operations).

import io.flutter.plugin.common.MethodChannel
// Used to send results (success/error) back to Flutter for this operation.

import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
// We launch the CM call on the main dispatcher; CM handles threading internally.

import java.lang.ref.WeakReference
// Use WeakReference<Activity> so we don’t leak a strong static reference to Activity.

private const val TAG = "GoogleLoginCM"
// Single Logcat tag used everywhere so you can easily filter logs.

 /**
  * GoogleLoginCM
  * Implements “Sign in with Google” using:
  * - Credential Manager (androidx.credentials)
  * - Google Identity Services (googleid)
  *
  * Key points:
  * - No deprecated GoogleSignInClient; this is the modern approach.
  * - No activity-result listener required; CM returns directly.
  * - Returns a Map to Flutter with idToken + profile info.
  * - Uses WeakReference<Activity> to avoid memory leaks.
  */
object GoogleLoginCM {

  // We keep a WeakReference to avoid static leaks (lint warning “Do not place Android context …”).
  private var activityRef: WeakReference<Activity>? = null

  // Tracks whether we’ve registered with the current Activity.
  private var isAttached = false

  /**
   * Called by your bridge when an Activity becomes available.
   * We store a weak reference and mark ourselves attached.
   */
  fun attach(binding: ActivityPluginBinding) {
    if (isAttached) {
      Log.d(TAG, "attach(): already attached; skipping")
      return
    }
    // Store the Activity weakly so GC can collect it if needed.
    activityRef = WeakReference(binding.activity)
    isAttached = true
    Log.d(TAG, "attach(): Activity set -> ${binding.activity::class.java.simpleName}")
  }

  /**
   * Called when Activity is no longer valid (config change or detach).
   * We clear the weak reference.
   */
  fun detach() {
    Log.d(TAG, "detach(): clearing references")
    isAttached = false
    activityRef?.clear()
    activityRef = null
  }

  /**
   * Starts Google sign-in via Credential Manager.
   *
   * serverClientId: Web client ID from Google Cloud/Firebase (REQUIRED to receive an ID token).
   * result: MethodChannel.Result to return success/error back to Flutter.
   *
   * Flow:
   * 1) Validate we have an Activity and a client ID.
   * 2) Build CredentialManager + GetGoogleIdOption + GetCredentialRequest.
   * 3) Call credentialManager.getCredential(...) on main; library handles threading.
   * 4) If credential is a Google ID token, parse with GoogleIdTokenCredential.createFrom.
   * 5) Build a payload Map and return success to Flutter; handle all errors gracefully.
   */
  fun signIn(serverClientId: String?, result: MethodChannel.Result) {
    Log.d(TAG, "signIn(): invoked with serverClientId=$serverClientId")

    // Get the current Activity (or fail fast if null).
    val act = activityRef?.get()
    if (act == null) {
      Log.d(TAG, "signIn(): NO_ACTIVITY")
      result.error("NO_ACTIVITY", "Activity not available", null)
      return
    }

    // Without a proper Web client ID, Google cannot mint an ID token.
    if (serverClientId.isNullOrBlank()) {
      Log.d(TAG, "signIn(): NO_WEB_CLIENT_ID")
      result.error("NO_WEB_CLIENT_ID", "serverClientId (Web client ID) is required", null)
      return
    }

    // Create the CredentialManager bound to this Activity context.
    val credentialManager = CredentialManager.create(act).also {
      Log.d(TAG, "signIn(): CredentialManager created")
    }

    // Describe the Google Sign-In option. You can tweak these flags:
    // - filterByAuthorizedAccounts(false): allow any Google account, not just previously authorized ones.
    // - autoSelect(false): if only one credential exists, don’t auto-select; show account chooser.
    val googleIdOption = GetGoogleIdOption.Builder()
      .setServerClientId(serverClientId)
      .setFilterByAuthorizedAccounts(false)
      .setAutoSelectEnabled(false)
      .build()
    Log.d(TAG, "signIn(): GetGoogleIdOption built (filter=false, autoSelect=false)")

    // Build the CM request with the Google option; you could add passkeys or others here as well.
    val request = GetCredentialRequest.Builder()
      .addCredentialOption(googleIdOption)
      .build()
    Log.d(TAG, "signIn(): GetCredentialRequest built")

    // Launch the request on main. CM will do any heavy lifting internally.
    Log.d(TAG, "signIn(): launching CredentialManager.getCredential()")
    CoroutineScope(Dispatchers.Main).launch {
      try {
        // Blocks until the user chooses a Google account or cancels.
        val resp = credentialManager.getCredential(act, request)
        Log.d(TAG, "signIn(): getCredential() returned, credential.type=${resp.credential.type}")

        val cred = resp.credential

        // Google ID token arrives as a CustomCredential with a specific type constant.
        if (cred is CustomCredential &&
          cred.type == GoogleIdTokenCredential.TYPE_GOOGLE_ID_TOKEN_CREDENTIAL
        ) {
          // Convert the credential’s bundle to a typed GoogleIdTokenCredential.
          val googleCred = GoogleIdTokenCredential.createFrom(cred.data)

          // Log some summary info for debugging (avoid logging full tokens in production).
          Log.d(
            TAG,
            "signIn(): credential parsed -> " +
              "idToken(len)=${googleCred.idToken.length}, " +
              "id=${googleCred.id}, " +
              "displayName=${googleCred.displayName}, " +
              "givenName=${googleCred.givenName}, " +
              "familyName=${googleCred.familyName}, " +
              "photoUrl=${googleCred.profilePictureUri}"
          )

          // Prepare payload for Flutter side. idToken is what you usually send to your backend/Firebase auth.
          val payload = mapOf(
            "idToken" to googleCred.idToken,                                 // Use this to authenticate server-side
            "id" to (googleCred.id ?: ""),                                   // Google user ID
            "displayName" to (googleCred.displayName ?: ""),                 // Profile name
            "givenName" to (googleCred.givenName ?: ""),                     // First name
            "familyName" to (googleCred.familyName ?: ""),                   // Last name
            "photoUrl" to (googleCred.profilePictureUri?.toString() ?: "")   // Profile image URL
          )

          Log.d(TAG, "signIn(): success payload=$payload")
          result.success(payload)
        } else {
          // If you got here, the returned credential is not a Google ID token (e.g., a passkey).
          Log.d(TAG, "signIn(): unsupported credential type=${cred.type}")
          result.error("UNSUPPORTED_CREDENTIAL", "Unexpected type: ${cred.type}", null)
        }
      } catch (e: NoCredentialException) {
        // No stored credentials or the user dismissed the account chooser.
        Log.d(TAG, "signIn(): NoCredentialException (user canceled or none available) -> ${e.message}")
        result.error("NO_CREDENTIAL", "No credential or user canceled", null)
      } catch (e: GetCredentialCancellationException) {
        // The user explicitly canceled the operation.
        Log.d(TAG, "signIn(): GetCredentialCancellationException (user canceled) -> ${e.message}")
        result.error("CANCELED", "User canceled", null)
      } catch (e: GetCredentialException) {
        // General CM error (network, configuration, etc.)
        Log.d(TAG, "signIn(): GetCredentialException -> ${e.message}", e)
        result.error("GET_CREDENTIAL_FAILED", e.localizedMessage, null)
      } catch (t: Throwable) {
        // Catch any unexpected exceptions to avoid crashing.
        Log.d(TAG, "signIn(): unexpected error -> ${t.message}", t)
        result.error("GOOGLE_SIGN_IN_ERROR", t.localizedMessage, null)
      }
    }
  }

  /**
   * Sign-out is typically handled server-side for ID tokens (revoke on backend).
   * Provided as no-op for API parity with a success response and logs.
   */
  fun signOut(result: MethodChannel.Result) {
    Log.d(TAG, "signOut(): no-op (handled at backend/token revocation level)")
    result.success(true)
  }
}