# Ihute Flutter Setup (Android + iOS)

This folder contains a standalone Flutter app scaffold:

- Package id / bundle id: `rw.ihute.ihute_flutter`
- Platforms: `android`, `ios`

## 1) Windows Android setup

From `ihute_flutter`:

```powershell
$env:GIT_CONFIG_COUNT='1'
$env:GIT_CONFIG_KEY_0='safe.directory'
$env:GIT_CONFIG_VALUE_0='C:/Users/UwAngelique/Desktop/flutter'
flutter pub get
flutter run
```

Use a connected Android device or running emulator.

If Android build fails with Java/Gradle compatibility, either:

- Use JDK 17 or 21 for Flutter, or
- Upgrade Android Gradle tooling in `android/`.

## 2) iOS testing (must be on Mac)

1. Install Xcode and CocoaPods.
2. Copy this repo to the Mac.
3. From `ihute_flutter` run:

```bash
flutter pub get
flutter build ios --debug
open ios/Runner.xcworkspace
```

4. In Xcode:
   - Select the `Runner` target.
   - Set your Apple Developer Team in **Signing & Capabilities**.
   - Ensure bundle id is unique if needed.
   - Choose a simulator/device and press Run.

## 3) Release builds

- Android release:
  - `flutter build appbundle`
- iOS release (Mac + Apple account):
  - `flutter build ipa`

## 4) Next migration step

This is currently the default Flutter counter app. To fully migrate from your existing Capacitor app, we should port your real screens, API layer, and auth flows into `lib/` next.
