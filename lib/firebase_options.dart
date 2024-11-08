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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA-u48iDyoLlsHiieGfJmlQtQV_Q9n7W7U',
    appId: '1:163633333549:web:c4686bf320d4fe47f7bfa4',
    messagingSenderId: '163633333549',
    projectId: 'lista-de-contat',
    authDomain: 'lista-de-contat.firebaseapp.com',
    storageBucket: 'lista-de-contat.firebasestorage.app',
    measurementId: 'G-3W95X9C114',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWt_VeRMin3pvfIhX6QC8drf4y2ljaus4',
    appId: '1:163633333549:android:c05d946730b176e3f7bfa4',
    messagingSenderId: '163633333549',
    projectId: 'lista-de-contat',
    storageBucket: 'lista-de-contat.firebasestorage.app',
  );
}
