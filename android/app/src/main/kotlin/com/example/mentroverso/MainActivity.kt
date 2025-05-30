package com.example.mentroverso

import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.BroadcastReceiver
import android.content.Context
import android.content.IntentFilter


class MainActivity : FlutterActivity() {
    private val CHANNEL = "unity_launcher.dart"
    private lateinit var methodChannel: MethodChannel
    private val handler = Handler(Looper.getMainLooper())

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)

        methodChannel.setMethodCallHandler { call, result ->
            when (call.method) {
                "launchUnity" -> launchUnity(result)
                else -> result.notImplemented()
            }
        }
    }

    private fun launchUnity(result: MethodChannel.Result) {
        try {
            val intent = Intent(this, CustomUnityActivity::class.java).apply {
                flags = Intent.FLAG_ACTIVITY_SINGLE_TOP or Intent.FLAG_ACTIVITY_CLEAR_TOP
            }
            startActivity(intent)
            result.success("Unity launched")
        } catch (e: Exception) {
            result.error("LAUNCH_FAILED", e.message, null)
        }
    }

    // ✅ Correct method signature and null safety
    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        handleUnityResult(intent)
    }


    private fun handleUnityResult(intent: Intent) {
        val method = intent.getStringExtra("method")
        val data = intent.getStringExtra("data")
        Log.d("MainActivity", "Unity returned method=$method, data=$data")

        when (method) {
            "onInterviewCompleted" -> {
                handler.post {
                    methodChannel.invokeMethod("onInterviewCompleted", data)
                }
            }
        }
    }

    private val unityReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            val method = intent?.getStringExtra("method")
            val data = intent?.getStringExtra("data")
            if (method == "onInterviewCompleted") {
                Log.d("MainActivity", "📨 Received interview result: $data")
                runOnUiThread {
                    methodChannel.invokeMethod("onInterviewCompleted", data)

                }
            }
        }
    }

    override fun onResume() {
        super.onResume()
        registerReceiver(unityReceiver, IntentFilter("com.unity.INTERVIEW_COMPLETED"))
    }

    override fun onPause() {
        super.onPause()
        unregisterReceiver(unityReceiver)
    }


    override fun onDestroy() {
        handler.removeCallbacksAndMessages(null)
        methodChannel.setMethodCallHandler(null)
        super.onDestroy()
    }
}
