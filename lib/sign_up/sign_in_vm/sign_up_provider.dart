import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';

import '../../quiz_screen/screen/home_screen.dart';

class SignUpProvider with ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signUpMethod() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      log('created new account');
      Navigator.push(navigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    }).onError((error, stackTrace) {
      log('Error ${error.toString()}');
    });
    notifyListeners();
  }
}
