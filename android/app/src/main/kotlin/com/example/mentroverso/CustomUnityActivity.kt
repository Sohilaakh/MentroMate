package com.example.mentroverso

import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.os.Process
import android.util.Log
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import android.content.pm.PackageManager
import com.unity3d.player.UnityPlayer
import com.unity3d.player.UnityPlayerActivity

class CustomUnityActivity : UnityPlayerActivity() {

    private val handler = Handler(Looper.getMainLooper())
    private var isShuttingDown = false

    companion object {
        private var instance: CustomUnityActivity? = null

        @JvmStatic
        fun onInterviewCompleted(result: String) {
            Log.d("CustomUnityActivity", "📨 Unity sent result: $result")
            instance?.sendToFlutter("onInterviewCompleted", result)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        instance = this

        if (ContextCompat.checkSelfPermission(this, android.Manifest.permission.RECORD_AUDIO)
            != PackageManager.PERMISSION_GRANTED
        ) {
            ActivityCompat.requestPermissions(
                this,
                arrayOf(android.Manifest.permission.RECORD_AUDIO),
                1234
            )
        }
    }


    private fun sendToFlutter(method: String, data: String) {
        try {
            val intent = Intent(this, MainActivity::class.java).apply {
                putExtra("method", method)
                putExtra("data", data)
                flags = Intent.FLAG_ACTIVITY_REORDER_TO_FRONT or
                        Intent.FLAG_ACTIVITY_SINGLE_TOP or
                        Intent.FLAG_ACTIVITY_CLEAR_TOP
            }
            Log.d("CustomUnityActivity", "📤 Sending intent to Flutter with method=$method")
            startActivity(intent)
        } catch (e: Exception) {
            Log.e("CustomUnityActivity", "❌ Failed to send result to Flutter", e)
        }
    }

    override fun onDestroy() {
        Log.d("CustomUnityActivity", "🗑️ onDestroy called")
        super.onDestroy()
        nuclearShutdown()
    }

    private fun nuclearShutdown() {
        if (isShuttingDown) return
        isShuttingDown = true

        Log.d("CustomUnityActivity", "💣 Starting nuclear shutdown")

        runOnUiThread {
            try {
                mUnityPlayer?.let {
                    try {
                        it.pause()
                        it.windowFocusChanged(false)
                        it.quit()
                    } catch (e: Exception) {
                        Log.e("CustomUnityActivity", "⚠️ Unity cleanup failed", e)
                    }
                }

                finish()
                overridePendingTransition(0, 0)

                handler.postDelayed({
                    Log.d("CustomUnityActivity", "🔴 Forcing process kill")
                    Process.killProcess(Process.myPid())
                }, 100)

            } catch (e: Exception) {
                Log.e("CustomUnityActivity", "❗ Shutdown error", e)
                Process.killProcess(Process.myPid())
            }
        }
    }
}
