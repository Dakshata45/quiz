import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';

import '../../quiz_screen/screen/home_screen.dart';

class SignInProvider with ChangeNotifier {
  TextEditingController usernameController =
      TextEditingController();
  TextEditingController passwordController =
      TextEditingController();

  signInMethod() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: usernameController.text, password: passwordController.text)
        .then((value) {
      Navigator.push(navigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    }).onError((error, stackTrace) {
      debugPrint("error - ${error.toString()}");
    });
    notifyListeners();
  }
}
