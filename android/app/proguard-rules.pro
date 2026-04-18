# Flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

-keepattributes *Annotation*
-dontwarn androidx.**

# Referenced by Flutter deferred components; optional Play Feature Delivery APIs.
-dontwarn com.google.android.play.core.**
