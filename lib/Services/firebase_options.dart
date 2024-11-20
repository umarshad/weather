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
    apiKey: 'AIzaSyCVJEATRQA6FHqG7OTfa94lBCwKOBtsBYM',
    appId: '1:466338460845:web:b0a63b4a3f36e80901c224',
    messagingSenderId: '466338460845',
    projectId: 'weather-app-2dc5f',
    authDomain: 'weather-app-2dc5f.firebaseapp.com',
    storageBucket: 'weather-app-2dc5f.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRa52pvkPL1v9fCDSA0_YPQtJrKTKyiIE',
    appId: '1:466338460845:android:c623a3c7cbfa3dd001c224',
    messagingSenderId: '466338460845',
    projectId: 'weather-app-2dc5f',
    storageBucket: 'weather-app-2dc5f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDlFfj8uC9-9q-2gLStW5ZAZReAUWOKOpM',
    appId: '1:466338460845:ios:54f47bda3deae91e01c224',
    messagingSenderId: '466338460845',
    projectId: 'weather-app-2dc5f',
    storageBucket: 'weather-app-2dc5f.firebasestorage.app',
    iosBundleId: 'com.example.weather',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDlFfj8uC9-9q-2gLStW5ZAZReAUWOKOpM',
    appId: '1:466338460845:ios:54f47bda3deae91e01c224',
    messagingSenderId: '466338460845',
    projectId: 'weather-app-2dc5f',
    storageBucket: 'weather-app-2dc5f.firebasestorage.app',
    iosBundleId: 'com.example.weather',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCVJEATRQA6FHqG7OTfa94lBCwKOBtsBYM',
    appId: '1:466338460845:web:8b060b08a6f444fc01c224',
    messagingSenderId: '466338460845',
    projectId: 'weather-app-2dc5f',
    authDomain: 'weather-app-2dc5f.firebaseapp.com',
    storageBucket: 'weather-app-2dc5f.firebasestorage.app',
  );
}
