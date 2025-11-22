# RUN - Bus Tracker App

A Flutter application for tracking buses in real-time with live location updates and ETA predictions.

## Prerequisites

Before running this app, make sure you have:

1. **Flutter SDK** installed (version 3.0.0 or higher)
   - Download from: https://flutter.dev/docs/get-started/install
   - Verify installation: `flutter doctor`

2. **Android Studio** or **VS Code** with Flutter extensions
   - For Android development: Android Studio
   - For iOS development: Xcode (macOS only)

3. **Firebase Account** (optional, for authentication and database)
   - Create a project at: https://console.firebase.google.com

## Setup Instructions

### 1. Install Dependencies

Open a terminal in the project root directory and run:

```bash
flutter pub get
```

This will install all the required packages listed in `pubspec.yaml`.

### 2. Check Flutter Setup

Verify your Flutter installation:

```bash
flutter doctor
```

Make sure all required components are installed (Android toolchain, iOS toolchain if on macOS, etc.).

### 3. Firebase Configuration (Optional)

If you plan to use Firebase services:

1. Create a Firebase project at https://console.firebase.google.com
2. Add Android/iOS apps to your Firebase project
3. Download configuration files:
   - **Android**: `google-services.json` → place in `android/app/`
   - **iOS**: `GoogleService-Info.plist` → place in `ios/Runner/`
4. Update `lib/main.dart` to initialize Firebase:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
```

### 4. Google Maps API Key (For Map Features)

1. Get a Google Maps API key from: https://console.cloud.google.com
2. **For Android**: Add to `android/app/src/main/AndroidManifest.xml`:
   ```xml
   <meta-data
       android:name="com.google.android.geo.API_KEY"
       android:value="YOUR_API_KEY_HERE"/>
   ```
3. **For iOS**: Add to `ios/Runner/AppDelegate.swift` or `Info.plist`

## Running the App

### Run on Connected Device/Emulator

1. **List available devices:**
   ```bash
   flutter devices
   ```

2. **Run the app:**
   ```bash
   flutter run
   ```

   Or specify a device:
   ```bash
   flutter run -d <device-id>
   ```

### Run on Android Emulator

1. Start an Android emulator from Android Studio
2. Run:
   ```bash
   flutter run
   ```

### Run on iOS Simulator (macOS only)

1. Open iOS Simulator:
   ```bash
   open -a Simulator
   ```
2. Run:
   ```bash
   flutter run
   ```

### Run on Physical Device

**Android:**
1. Enable Developer Options and USB Debugging on your Android device
2. Connect via USB
3. Run: `flutter run`

**iOS:**
1. Connect your iPhone/iPad
2. Trust the computer on your device
3. Run: `flutter run`

## Build Commands

### Build APK (Android)
```bash
flutter build apk
```

### Build App Bundle (Android - for Play Store)
```bash
flutter build appbundle
```

### Build iOS (macOS only)
```bash
flutter build ios
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── screens/                  # UI screens
├── widgets/                  # Reusable widgets
├── services/                 # Business logic & API calls
├── models/                   # Data models
├── utils/                    # Utilities & constants
└── provider/                 # State management
```

## Troubleshooting

### Common Issues

1. **"No devices found"**
   - Make sure a device/emulator is running
   - Check with: `flutter devices`

2. **"Gradle build failed"**
   - Run: `cd android && ./gradlew clean`
   - Then: `flutter clean && flutter pub get`

3. **"Firebase not initialized"**
   - Make sure Firebase is configured (see step 3 above)
   - Or comment out Firebase-related code if not using it

4. **"Package not found"**
   - Run: `flutter pub get`
   - If issue persists: `flutter clean && flutter pub get`

5. **Location permissions**
   - The app requires location permissions
   - Make sure to grant permissions when prompted

## Development Tips

- Use `flutter hot reload` (press `r` in terminal) for quick updates
- Use `flutter hot restart` (press `R` in terminal) for full restart
- Check logs: `flutter logs`

## Dependencies

- **Provider**: State management
- **Firebase**: Authentication & database
- **Geolocator**: Location services
- **Google Maps**: Map display
- **Local Notifications**: Push notifications

## License

This project is for educational purposes.

