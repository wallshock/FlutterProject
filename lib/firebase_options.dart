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
    apiKey: 'AIzaSyDj6XCubbAkN9yv9tMlVCrqnP69oCGmR00',
    appId: '1:879141302254:web:471170dc14aa089cdf28ff',
    messagingSenderId: '879141302254',
    projectId: 'thirtyseven',
    authDomain: 'thirtyseven.firebaseapp.com',
    storageBucket: 'thirtyseven.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDy4IjjDDeTk74G79VCzEzSvxoEJJqnMF8',
    appId: '1:879141302254:android:d06e4ad572aa8ebfdf28ff',
    messagingSenderId: '879141302254',
    projectId: 'thirtyseven',
    storageBucket: 'thirtyseven.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3AKWub5878QVOS6_QrtZw6rQDxUw7eKo',
    appId: '1:879141302254:ios:a905de2cbaf6d97fdf28ff',
    messagingSenderId: '879141302254',
    projectId: 'thirtyseven',
    storageBucket: 'thirtyseven.appspot.com',
    iosClientId:
        '879141302254-j7rekddfunktnfugb2jr497u8tivoot0.apps.googleusercontent.com',
    iosBundleId: 'thirtyseven',
  );
}
