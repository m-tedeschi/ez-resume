import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBQOndBnOXhEJP-YR4p-llRys54W1td_Zs",
            authDomain: "ez-resume-hmpgul.firebaseapp.com",
            projectId: "ez-resume-hmpgul",
            storageBucket: "ez-resume-hmpgul.appspot.com",
            messagingSenderId: "349287858566",
            appId: "1:349287858566:web:a224cd8a83888a02dd2c07",
            measurementId: "G-6XV9YYJ0BQ"));
  } else {
    await Firebase.initializeApp();
  }
}
