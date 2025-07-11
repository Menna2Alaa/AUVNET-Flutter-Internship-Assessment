// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDCvpU1ikFtz2miPEC6yKDXgXPT_OmiyPE',
    appId: '1:557281980823:web:49be770036acdb69ce14d2',
    messagingSenderId: '557281980823',
    projectId: 'e-commerce-app-ba966',
    authDomain: 'e-commerce-app-ba966.firebaseapp.com',
    storageBucket: 'e-commerce-app-ba966.firebasestorage.app',
    measurementId: 'G-KPE6QS0H2K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDeHRcL3kVr-F6fgA3WCEOTBKFTyJx-VwA',
    appId: '1:557281980823:android:6ed597a7de2215c8ce14d2',
    messagingSenderId: '557281980823',
    projectId: 'e-commerce-app-ba966',
    storageBucket: 'e-commerce-app-ba966.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCEc5t7R5p9wB34APC3eWsnttItMwHi-P0',
    appId: '1:557281980823:ios:911dc4445e196aabce14d2',
    messagingSenderId: '557281980823',
    projectId: 'e-commerce-app-ba966',
    storageBucket: 'e-commerce-app-ba966.firebasestorage.app',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCEc5t7R5p9wB34APC3eWsnttItMwHi-P0',
    appId: '1:557281980823:ios:911dc4445e196aabce14d2',
    messagingSenderId: '557281980823',
    projectId: 'e-commerce-app-ba966',
    storageBucket: 'e-commerce-app-ba966.firebasestorage.app',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDCvpU1ikFtz2miPEC6yKDXgXPT_OmiyPE',
    appId: '1:557281980823:web:0f4e32ebc6a0b0b3ce14d2',
    messagingSenderId: '557281980823',
    projectId: 'e-commerce-app-ba966',
    authDomain: 'e-commerce-app-ba966.firebaseapp.com',
    storageBucket: 'e-commerce-app-ba966.firebasestorage.app',
    measurementId: 'G-P5G9D3SYZD',
  );
}
