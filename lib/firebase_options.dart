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
    apiKey: 'AIzaSyBKAoNApK7oSC3zSmBgCLNtRyQAJCzc2Tc',
    appId: '1:11109032923:web:8c11bc47106162d387bdfe',
    messagingSenderId: '11109032923',
    projectId: 'app-peluqueria-2ca58',
    authDomain: 'app-peluqueria-2ca58.firebaseapp.com',
    storageBucket: 'app-peluqueria-2ca58.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBglHxEtouRD410S82NAcq3CdUfHtp1C_8',
    appId: '1:11109032923:android:651d22465e748ecf87bdfe',
    messagingSenderId: '11109032923',
    projectId: 'app-peluqueria-2ca58',
    storageBucket: 'app-peluqueria-2ca58.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_pFUBUVMwLGD8pm7anCvaMGGt9knOm7k',
    appId: '1:11109032923:ios:67ac822d09194c1487bdfe',
    messagingSenderId: '11109032923',
    projectId: 'app-peluqueria-2ca58',
    storageBucket: 'app-peluqueria-2ca58.appspot.com',
    iosClientId: '11109032923-gmug8a8hltnjqti4mr07ee1eatoihq74.apps.googleusercontent.com',
    iosBundleId: 'com.leya0802.leya080203',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA_pFUBUVMwLGD8pm7anCvaMGGt9knOm7k',
    appId: '1:11109032923:ios:67ac822d09194c1487bdfe',
    messagingSenderId: '11109032923',
    projectId: 'app-peluqueria-2ca58',
    storageBucket: 'app-peluqueria-2ca58.appspot.com',
    iosClientId: '11109032923-gmug8a8hltnjqti4mr07ee1eatoihq74.apps.googleusercontent.com',
    iosBundleId: 'com.leya0802.leya080203',
  );
}