import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCRe0YkXrrRUjRKhZtbO_pUdMmm4hoD7z4",
            authDomain: "djal-auto-be4ed.firebaseapp.com",
            projectId: "djal-auto-be4ed",
            storageBucket: "djal-auto-be4ed.appspot.com",
            messagingSenderId: "947473130835",
            appId: "1:947473130835:web:d232bd6a1f22a71265eda6",
            measurementId: "G-NL7Q13B49V"));
  } else {
    await Firebase.initializeApp();
  }
}
