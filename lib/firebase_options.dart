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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDE8sA0kiiYyFgHlxZSG9Q3LGOdhEgzSuE',
    appId: '1:435069780432:web:651ecdd845be2cc16c39d5',
    messagingSenderId: '435069780432',
    projectId: 'dropmate-85571',
    authDomain: 'dropmate-85571.firebaseapp.com',
    storageBucket: 'dropmate-85571.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDiMNzfgNkFzSjmNEM9ypausKFt8-lFXgo',
    appId: '1:435069780432:android:4b4f3ec00cf0814e6c39d5',
    messagingSenderId: '435069780432',
    projectId: 'dropmate-85571',
    storageBucket: 'dropmate-85571.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAjysu0fHnrpp3Zv6fjtL2uj0Mm7jzbKKc',
    appId: '1:435069780432:ios:81c810e10e27d6826c39d5',
    messagingSenderId: '435069780432',
    projectId: 'dropmate-85571',
    storageBucket: 'dropmate-85571.firebasestorage.app',
    iosBundleId: 'com.example.dropmate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAjysu0fHnrpp3Zv6fjtL2uj0Mm7jzbKKc',
    appId: '1:435069780432:ios:81c810e10e27d6826c39d5',
    messagingSenderId: '435069780432',
    projectId: 'dropmate-85571',
    storageBucket: 'dropmate-85571.firebasestorage.app',
    iosBundleId: 'com.example.dropmate',
  );
}
