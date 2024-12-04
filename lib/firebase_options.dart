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
    apiKey: 'AIzaSyA3nS6WsxpjAKsTPffHHaxfhF-pvaWqjV0',
    appId: '1:958076113979:web:e0dc44e72299ec7a85b81e',
    messagingSenderId: '958076113979',
    projectId: 'rent-n-drive-f6468',
    authDomain: 'rent-n-drive-f6468.firebaseapp.com',
    storageBucket: 'rent-n-drive-f6468.firebasestorage.app',
    measurementId: 'G-QL95CX33M3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdz1AY7c1pN-aRMO5DlrDAnPoK7m0m4VM',
    appId: '1:958076113979:android:5f9f3f91cb789ba185b81e',
    messagingSenderId: '958076113979',
    projectId: 'rent-n-drive-f6468',
    storageBucket: 'rent-n-drive-f6468.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCq2sUlDwzuUf3SW7mT4AC8PprfDCb9BRM',
    appId: '1:958076113979:ios:e9dc8e8080d0e89d85b81e',
    messagingSenderId: '958076113979',
    projectId: 'rent-n-drive-f6468',
    storageBucket: 'rent-n-drive-f6468.firebasestorage.app',
    iosBundleId: 'com.example.rentMe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCq2sUlDwzuUf3SW7mT4AC8PprfDCb9BRM',
    appId: '1:958076113979:ios:e9dc8e8080d0e89d85b81e',
    messagingSenderId: '958076113979',
    projectId: 'rent-n-drive-f6468',
    storageBucket: 'rent-n-drive-f6468.firebasestorage.app',
    iosBundleId: 'com.example.rentMe',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA3nS6WsxpjAKsTPffHHaxfhF-pvaWqjV0',
    appId: '1:958076113979:web:36295da504a7845185b81e',
    messagingSenderId: '958076113979',
    projectId: 'rent-n-drive-f6468',
    authDomain: 'rent-n-drive-f6468.firebaseapp.com',
    storageBucket: 'rent-n-drive-f6468.firebasestorage.app',
    measurementId: 'G-K4CEHMK6L6',
  );
}
