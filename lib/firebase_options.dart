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
    apiKey: 'AIzaSyDtmfqUbgPhV8UeORCvU7YEtn18fvp6OQI',
    appId: '1:987473709036:web:54da100437e283742622c9',
    messagingSenderId: '987473709036',
    projectId: 'notesapp-atgcoder27',
    authDomain: 'notesapp-atgcoder27.firebaseapp.com',
    storageBucket: 'notesapp-atgcoder27.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbT83Posm0mZZ0jQoEOtoy9pRI2uulkrw',
    appId: '1:987473709036:android:25a082e82c8fb2242622c9',
    messagingSenderId: '987473709036',
    projectId: 'notesapp-atgcoder27',
    storageBucket: 'notesapp-atgcoder27.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAx9SaWlyti6wAA4fFOFDIMW7nVcnsx6w0',
    appId: '1:987473709036:ios:cb17ef33cc8368732622c9',
    messagingSenderId: '987473709036',
    projectId: 'notesapp-atgcoder27',
    storageBucket: 'notesapp-atgcoder27.appspot.com',
    iosClientId: '987473709036-ocavrt5csadb1btatan1v4pdm4en9eug.apps.googleusercontent.com',
    iosBundleId: 'in.atgcoder27.notesapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAx9SaWlyti6wAA4fFOFDIMW7nVcnsx6w0',
    appId: '1:987473709036:ios:cb17ef33cc8368732622c9',
    messagingSenderId: '987473709036',
    projectId: 'notesapp-atgcoder27',
    storageBucket: 'notesapp-atgcoder27.appspot.com',
    iosClientId: '987473709036-ocavrt5csadb1btatan1v4pdm4en9eug.apps.googleusercontent.com',
    iosBundleId: 'in.atgcoder27.notesapp',
  );
}
