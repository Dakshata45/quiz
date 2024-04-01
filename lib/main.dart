import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/sign_in/screen/sign_in_screen.dart';
import 'package:quiz_app/sign_in/sign_in_vm/sign_in_provider.dart';
import 'package:quiz_app/sign_up/sign_in_vm/sign_up_provider.dart';
import 'package:quiz_app/utils/color_utils.dart';

import 'quiz_screen/model/db_connect.dart';
import 'quiz_screen/quiz_vm/quiz_provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyCTwY05RMjpObND5h2LUiHWGx08PitoRmQ',
        appId: '1:882757820543:android:7a3d0f5d75fa1c1cd15f4a',
        storageBucket: "quiz-app-269d2.appspot.com",
        projectId: 'quiz-app-269d2',
        messagingSenderId: ''),
  );

  var db = DBconnect();
  db.fetchQuestions();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => QuizProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SignInScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: hexStringToColor('#F2F4F4'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/splash.png',
              width: MediaQuery.of(context).size.width * 0.80,
            ),
            const SizedBox(height: 50),
            Text('QUIZ',
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 100.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: <Color>[
                          Color(0xFFFF0064),
                          Color(0xFFFF7600),
                          Color(0xFFFFD500),
                          Color(0xFF8CFE00),
                          Color(0xFF00E86C),
                          Color(0xFF00F4F2),
                          Color(0xFF00CCFF),
                          Color(0xFF70A2FF),
                          Color(0xFFA96CFF),
                        ],
                      ).createShader(
                          const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)))),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'Be ready. ',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: hexStringToColor('#6C3483')),
                children: <TextSpan>[
                  TextSpan(
                      text: ' Be smart. ',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: hexStringToColor('#117A65'))),
                  TextSpan(
                      text: ' Be noticed!',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: hexStringToColor('#B03A2E'))),
                ],
              ),
            )
          ],
        ));
  }
}
