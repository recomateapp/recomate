import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDFg1ANsuHgIUK2xVXobwQJeR3ujZmEJy4",
            authDomain: "recomate-350a1.firebaseapp.com",
            projectId: "recomate-350a1",
            storageBucket: "recomate-350a1.firebasestorage.app",
            messagingSenderId: "167240103398",
            appId: "1:167240103398:web:29cb50813ef6334ff3d227",
            measurementId: "G-8HCLVQT8RS"));
  } else {
    await Firebase.initializeApp();
  }
}
