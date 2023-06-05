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
    apiKey: 'AIzaSyAjTgs5TiSFJYI3g7fyy00veVVcogE2smo',
    appId: '1:464895301725:web:a08228fd70942e5a0655b4',
    messagingSenderId: '464895301725',
    projectId: 'teste-799fe',
    authDomain: 'teste-799fe.firebaseapp.com',
    storageBucket: 'teste-799fe.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmCiK_rXQjO1wueeVKA_zHFxwZUtDRKOQ',
    appId: '1:464895301725:android:54cc0d36542d4abd0655b4',
    messagingSenderId: '464895301725',
    projectId: 'teste-799fe',
    storageBucket: 'teste-799fe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDRQOyTyy1NtB0azMcB0AkLLx3mw8gcqtc',
    appId: '1:464895301725:ios:074e3256b26e05c20655b4',
    messagingSenderId: '464895301725',
    projectId: 'teste-799fe',
    storageBucket: 'teste-799fe.appspot.com',
    iosClientId: '464895301725-rmhg5al1mflengvanfmn7vmqailsrqn0.apps.googleusercontent.com',
    iosBundleId: 'com.example.teste',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDRQOyTyy1NtB0azMcB0AkLLx3mw8gcqtc',
    appId: '1:464895301725:ios:2406346cfd32ea9c0655b4',
    messagingSenderId: '464895301725',
    projectId: 'teste-799fe',
    storageBucket: 'teste-799fe.appspot.com',
    iosClientId: '464895301725-33bitdjmflu8sntfi44v4b5sn45bo4a6.apps.googleusercontent.com',
    iosBundleId: 'com.example.teste.RunnerTests',
  );
}
