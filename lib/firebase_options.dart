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
    apiKey: 'AIzaSyB9DTJSBOhjh0wCj-I_7rADO2ts2WySF8Y',
    appId: '1:559500029309:web:b2d811f6696cc91d98f014',
    messagingSenderId: '559500029309',
    projectId: 'bonjour-fae43',
    authDomain: 'bonjour-fae43.firebaseapp.com',
    storageBucket: 'bonjour-fae43.appspot.com',
    measurementId: 'G-8Q4H31YB5R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6csL3pa1I_mRxSD6dk4yN_TqyItvaBw8',
    appId: '1:559500029309:android:a88502f4e4c2a48e98f014',
    messagingSenderId: '559500029309',
    projectId: 'bonjour-fae43',
    storageBucket: 'bonjour-fae43.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxh-xUPXJwhMnHJLulVptOKuIoR6SctPU',
    appId: '1:559500029309:ios:d6fed6a686ebe1fd98f014',
    messagingSenderId: '559500029309',
    projectId: 'bonjour-fae43',
    storageBucket: 'bonjour-fae43.appspot.com',
    iosBundleId: 'com.example.bonjour',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCxh-xUPXJwhMnHJLulVptOKuIoR6SctPU',
    appId: '1:559500029309:ios:d6fed6a686ebe1fd98f014',
    messagingSenderId: '559500029309',
    projectId: 'bonjour-fae43',
    storageBucket: 'bonjour-fae43.appspot.com',
    iosBundleId: 'com.example.bonjour',
  );
}