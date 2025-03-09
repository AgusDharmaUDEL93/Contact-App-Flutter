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
    apiKey: 'AIzaSyCubKz6l6143aR_5ReosQwM_HqlzZ6rdCU',
    appId: '1:13721575804:web:1cec93c08e267de78644f9',
    messagingSenderId: '13721575804',
    projectId: 'contactapp-firebase',
    authDomain: 'contactapp-firebase.firebaseapp.com',
    databaseURL: 'https://contactapp-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'contactapp-firebase.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDoBBXgMVf3oWR5qkAkTxdn5AuRdJZwxxg',
    appId: '1:13721575804:android:4002706d9881c30a8644f9',
    messagingSenderId: '13721575804',
    projectId: 'contactapp-firebase',
    databaseURL: 'https://contactapp-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'contactapp-firebase.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmvCq3qSd-UDPbJtuPwwwmDVZqdMTyB-U',
    appId: '1:13721575804:ios:98a16f6252aead498644f9',
    messagingSenderId: '13721575804',
    projectId: 'contactapp-firebase',
    databaseURL: 'https://contactapp-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'contactapp-firebase.firebasestorage.app',
    androidClientId: '13721575804-rsfs6dmvqb8e4kj0gnol0ri6ukq7v481.apps.googleusercontent.com',
    iosClientId: '13721575804-kcrtpf62rnq9r635rataugstroa13ube.apps.googleusercontent.com',
    iosBundleId: 'com.example.contactApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCmvCq3qSd-UDPbJtuPwwwmDVZqdMTyB-U',
    appId: '1:13721575804:ios:98a16f6252aead498644f9',
    messagingSenderId: '13721575804',
    projectId: 'contactapp-firebase',
    databaseURL: 'https://contactapp-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'contactapp-firebase.firebasestorage.app',
    androidClientId: '13721575804-rsfs6dmvqb8e4kj0gnol0ri6ukq7v481.apps.googleusercontent.com',
    iosClientId: '13721575804-kcrtpf62rnq9r635rataugstroa13ube.apps.googleusercontent.com',
    iosBundleId: 'com.example.contactApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCubKz6l6143aR_5ReosQwM_HqlzZ6rdCU',
    appId: '1:13721575804:web:2725675b7342eb3c8644f9',
    messagingSenderId: '13721575804',
    projectId: 'contactapp-firebase',
    authDomain: 'contactapp-firebase.firebaseapp.com',
    databaseURL: 'https://contactapp-firebase-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'contactapp-firebase.firebasestorage.app',
  );
}
