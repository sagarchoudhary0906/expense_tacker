package com.example.expense_tracker

import android.app.Activity
import android.content.Context
import android.os.Handler
import android.os.Looper
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StringCodec
import android.util.Log

private const val TAG = "AppNativeBridge"
private const val GOOGLE_LOGIN_ACTION = "googleLogin" // action name Flutter will call

/**
 * AppNativeBridge
 * A robust, generic bridge between Flutter and Android using:
 * - MethodChannel (Flutter -> Android requests + Android -> Flutter callbacks)
 * - EventChannel (Android -> Flutter continuous events)
 * - BasicMessageChannel (bi-directional simple messaging)
 */
class AppNativeBridge : FlutterPlugin, ActivityAware,
    MethodChannel.MethodCallHandler, EventChannel.StreamHandler {

    private lateinit var appContext: Context
    private var activity: Activity? = null

    private lateinit var methodChannel: MethodChannel
    private lateinit var eventChannel: EventChannel
    private lateinit var messageChannel: BasicMessageChannel<String>

    private var eventSink: EventChannel.EventSink? = null
    private val mainHandler = Handler(Looper.getMainLooper())


    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        appContext = binding.applicationContext

        methodChannel = MethodChannel(binding.binaryMessenger, "app/native/methods")
        eventChannel = EventChannel(binding.binaryMessenger, "app/native/events")
        messageChannel = BasicMessageChannel(binding.binaryMessenger, "app/native/messages", StringCodec.INSTANCE)

        methodChannel.setMethodCallHandler(this)
        eventChannel.setStreamHandler(this)
        messageChannel.setMessageHandler { message, reply ->
            // Echo with small prefix so you know Android received it
            reply.reply("android-ack: ${message ?: ""}")
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        methodChannel.setMethodCallHandler(null)
        eventChannel.setStreamHandler(null)
    }

    // ActivityAware
    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        GoogleLoginCM.attach(binding)
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
        GoogleLoginCM.attach(binding)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        GoogleLoginCM.detach()
        activity = null
    }

    override fun onDetachedFromActivity() {
        GoogleLoginCM.detach()
        activity = null
    }

    // Flutter -> Android calls
    /**
     * Function which handles method calls from Flutter
     */
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        val action = call.method;
        val msg = call.argument<String>("message") ?: ""
        Log.d(TAG, "onMethodCall(): action=$action, msg=$msg")
        when (action) {
            // Handling Google Login Action from flutter -> Native Android
            GOOGLE_LOGIN_ACTION -> {
                val serverClientId = call.argument<String>("serverClientId")
                if (serverClientId.isNullOrBlank()) {
                    Log.d("GoogleLoginCM", "signIn(): NO_WEB_CLIENT_ID")
                    result.error(
                        "NO_WEB_CLIENT_ID",
                        "serverClientId (Web client ID) is required",
                        null
                    )
                } else {
                    Log.d("GoogleLoginCM", "Google Login action start on native side")
                    GoogleLoginCM.signIn(serverClientId, result) // <-- pass it to CM flow
                }
            }
            "ping" -> {
                Log.d(TAG, "ping() called from Flutter to Native android with: $msg")
                result.success("pong-from-android: $msg")

                // Call back into Flutter
                val data = mapOf("event" to "pingCallback", "message" to msg)
                sendCallBackToFlutter("pingFromAndroid", data);
            }
        }
    }

    /**
     * Function that sends call back from native android to flutter
     */
    private fun sendCallBackToFlutter (functionName : String, data : Map<String, Any?>) {
        methodChannel.invokeMethod(functionName, data)
    }

    // Android -> Flutter stream lifecycle
    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
        // Send an initial ready event
        eventSink?.success(mapOf("type" to "ready"))
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
    }
}


