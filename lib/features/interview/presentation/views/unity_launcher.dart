import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class UnityLauncher {
  static const MethodChannel _channel = MethodChannel('unity_launcher.dart');

  static Function(List<Map<String, dynamic>>)? _completionHandler;
  static bool _isInitialized = false;

  static Future<void> initialize() async {
    if (_isInitialized) return;

    _channel.setMethodCallHandler((call) async {
      debugPrint('UnityLauncher received: ${call.method}');

      switch (call.method) {
        case 'onInterviewCompleted':
          final raw = call.arguments as String?;
          if (raw == null) {
            debugPrint("❌ Empty result from Unity");
            return;
          }

          try {
            final parsed = jsonDecode(raw);
            if (parsed is List) {
              final result = parsed.cast<Map<String, dynamic>>();
              debugPrint("📨 Received answers from Unity: $result");
              _completionHandler?.call(result);
            } else {
              debugPrint("❌ Expected a list of answers from Unity but got: $parsed");
            }
          } catch (e) {
            debugPrint("❌ Failed to parse JSON: $e");
          }
          break;

        default:
          debugPrint('Unknown method: ${call.method}');
      }
    });

    _isInitialized = true;
  }

  static void setCompletionHandler(Function(List<Map<String, dynamic>>) handler) {
    _channel.setMethodCallHandler((call) async {
      if (call.method == "onInterviewCompleted") {
        final String? jsonString = call.arguments;
        if (jsonString != null && jsonString.isNotEmpty) {
          final List<Map<String, dynamic>> parsed =
          List<Map<String, dynamic>>.from(jsonDecode(jsonString));
          debugPrint("✅ Parsed answers: $parsed");
          handler(parsed);
        }
      }
    });
  }


  static Future<String> launchUnity() async {
    try {
      return await _channel.invokeMethod('launchUnity');
    } on PlatformException catch (e) {
      debugPrint('❌ Launch failed: ${e.message}');
      rethrow;
    }
  }
}
