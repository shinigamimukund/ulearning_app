// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyAHkbmqo8tpTlIWaDH0ifOVCI_wbfvV88w',
    appId: '1:732318786831:web:139fb958a12437b72f4a7a',
    messagingSenderId: '732318786831',
    projectId: 'ulearning-app-fb',
    authDomain: 'ulearning-app-fb.firebaseapp.com',
    storageBucket: 'ulearning-app-fb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZJmSW8kzTKs5mjuPnJtA8aXCoX8x9M00',
    appId: '1:732318786831:android:59fd6d1789b526882f4a7a',
    messagingSenderId: '732318786831',
    projectId: 'ulearning-app-fb',
    storageBucket: 'ulearning-app-fb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCEIFxVEmd6SmAQSquVJVP1Stod94Y9Usw',
    appId: '1:732318786831:ios:c68d0e2831690f052f4a7a',
    messagingSenderId: '732318786831',
    projectId: 'ulearning-app-fb',
    storageBucket: 'ulearning-app-fb.appspot.com',
    iosClientId: '732318786831-c3ls1vin5p6p507qthli8p4fb3l64fto.apps.googleusercontent.com',
    iosBundleId: 'com.mukund.ulearningApp',
  );
}
