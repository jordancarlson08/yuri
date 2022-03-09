// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAZmFFzgIJCxenFhOvUmJADLG0TUjY99YU',
    appId: '1:795099778212:web:c1a2c8fd4c1f8bfad8ea31',
    messagingSenderId: '795099778212',
    projectId: 'yuri-ebe98',
    authDomain: 'yuri-ebe98.firebaseapp.com',
    storageBucket: 'yuri-ebe98.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxWy5nSJTgzm37sME7elVBigpUEsVqIH0',
    appId: '1:795099778212:android:ab07b1dc4ec7dc95d8ea31',
    messagingSenderId: '795099778212',
    projectId: 'yuri-ebe98',
    storageBucket: 'yuri-ebe98.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPYi3i7pUPbqj7TseJrrEfjgiwDl0FclM',
    appId: '1:795099778212:ios:36a8c584f31cf285d8ea31',
    messagingSenderId: '795099778212',
    projectId: 'yuri-ebe98',
    storageBucket: 'yuri-ebe98.appspot.com',
    iosClientId: '795099778212-2kv76dfjf7tl9c35d044ol9thkl2ngvk.apps.googleusercontent.com',
    iosBundleId: 'com.chatbooks.yuri',
  );
}
