import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:http/http.dart' as http;
import 'package:expense_tracker/core/utility/constants.dart';

class ServerController {
  ServerController._();

  static const String _mainController = "expense";
  static const String _base = Constants.serverUrl; // e.g., your Cloudflare URL

  static String _normalize(String endpoint) {
    if (endpoint.isEmpty) return '/';
    return endpoint.startsWith('/') ? endpoint : '/$endpoint';
  }

  static Future<dynamic> requestJson({
    required String endpoint,
    required String method,
    Map<String, dynamic>? data,
    Duration timeout = const Duration(seconds: 10),
  }) async {
    final ep = _normalize(endpoint);
    var uri = Uri.parse('$_base$ep');

    //Server expects GET payload (if any) as urlencoded JSON in 'msg' query param.
    if (data != null && data.isNotEmpty) {
      uri = uri.replace(queryParameters: {
        'msg': jsonEncode(data),
      });
    }

    debugPrint("Sagar: uri = ${uri.toString()}");

    final headers = <String, String>{
      'Accept': 'application/json',
    };
    // Only set Content-Type when we actually send a body
    if (method.toUpperCase() != 'GET') {
      headers['Content-Type'] = 'application/json';
    }
    http.Response res;
    final m = method.toUpperCase();
    final sw = Stopwatch()..start();

    try {
      if (m == 'GET') {
        res = await http.get(uri, headers: headers).timeout(timeout);
      } else if (m == 'POST') {
        res = await http
            .post(uri, headers: headers, body: jsonEncode(data ?? {}))
            .timeout(timeout);
      } else {
        throw Exception('Unsupported HTTP method: $method');
      }
    } on TimeoutException {
      sw.stop();
      debugPrint(
          '[HTTP] x TIMEOUT after ${sw.elapsedMilliseconds} ms for $method $uri');
      throw Exception('Timeout calling $uri');
    } catch (e, st) {
      sw.stop();
      debugPrint(
          '[HTTP] x REQUEST FAILED after ${sw.elapsedMilliseconds} ms for $method $uri');
      debugPrint('[HTTP]   error: $e');
      debugPrint('[HTTP]   stack: $st');
      rethrow;
    }

    sw.stop();

    // Response log
    final ct = res.headers['content-type'] ?? '';
    final bodyStr = res.body;
    if (bodyStr.isEmpty) {
      debugPrint('[HTTP]    body: <empty>');
    } else {
      // Pretty-print JSON if possible, else raw (truncated)
      if (ct.contains('application/json')) {
        try {} catch (_) {}
      } else {}
    }

    if (res.statusCode < 200 || res.statusCode >= 300) {
      throw Exception('HTTP ${res.statusCode} ${res.reasonPhrase}: $bodyStr');
    }

    // Parse/return
    if (ct.contains('application/json')) {
      return bodyStr.isEmpty ? null : jsonDecode(bodyStr);
    }
    return bodyStr;
  }

  // Minimal convenience wrappers using only endpoint, data, timeout
  static Future<dynamic> get(String endpoint, Map<String, dynamic>? data,
      {Duration timeout = const Duration(seconds: 10)}) {
    return requestJson(
        endpoint: endpoint, method: 'GET', data: data, timeout: timeout);
  }

  static Future<dynamic> post(String endpoint, Map<String, dynamic>? data,
      {Duration timeout = const Duration(seconds: 10)}) {
    return requestJson(
        endpoint: endpoint, method: 'POST', data: data, timeout: timeout);
  }

  // Each Field of data should be in string format
  static Map<String, dynamic> getRequestPayload(
      String action, Map<String, dynamic>? data) {
    data ??= {};
    return {
      'c': _mainController,
      'a': action,
      'd': data,
    };
  }
}
