import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/reusable_widgets/progress_bar.dart';
import 'package:quiz_app/sign_in/screen/sign_in_screen.dart';

import '../../reusable_widgets/option_card.dart';
import '../../reusable_widgets/question_widget.dart';
import '../../utils/color_utils.dart';
import '../model/question_model.dart';
import '../quiz_vm/quiz_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<QuizProvider>(context, listen: false).initMethod();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(builder: (_, quizData, child) {
      return FutureBuilder(
        future: quizData.questions as Future<List<Question>>,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              var extractedData = snapshot.data as List<Question>;
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/quiz.jpg'), fit: BoxFit.fill),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  extendBodyBehindAppBar: true,
                  extendBody: true,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                    elevation: 0.0,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: CircleAvatar(
                            child: IconButton(
                          icon: const Icon(Icons.logout,
                              color: Colors.black, size: 20),
                          onPressed: () {
                            FirebaseAuth.instance.signOut().then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInScreen()));
                            }).onError((error, stackTrace) {
                              debugPrint("error - ${error.toString()}");
                            });
                          },
                        )),
                      ),
                    ],
                  ),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.08),
                          child: Card(
                            margin: const EdgeInsets.all(20.0),
                            color: Colors.white.withOpacity(0.3),
                            elevation: 6, // Change this
                            shadowColor: Colors.black12,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  QuestionWidget(
                                    indexAction: quizData.index,
                                    question:
                                        extractedData[quizData.index].title,
                                    totalQuestions: extractedData.length,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.10,
                                  ),
                                  for (int i = 0;
                                      i <
                                          extractedData[quizData.index]
                                              .options
                                              .length;
                                      i++) ...[
                                    OptionCard(
                                      option: extractedData[quizData.index]
                                          .options
                                          .keys
                                          .toList()[i],
                                      index: (i + 1).toString(),
                                      color: quizData.isPressed
                                          ? extractedData[quizData.index]
                                                      .options
                                                      .values
                                                      .toList()[i] ==
                                                  true
                                              ? greenLight
                                              : extractedData[quizData.index]
                                                              .options
                                                              .values
                                                              .toList()[i] ==
                                                          false &&
                                                      i ==
                                                          quizData.selectedIndex
                                                  ? redLight
                                                  : neutral
                                          : neutral,
                                      onTap: () {
                                        quizData.selectedIndex = i;
                                        debugPrint(
                                            'index = ${quizData.selectedIndex}');
                                        quizData.checkAnswerAndUpdate(
                                            extractedData[quizData.index]
                                                .options
                                                .values
                                                .toList()[i]);
                                      },
                                    ),
                                  ],
                                  const SizedBox(height: 50),
                                  reusableProgressBar(
                                      extractedData, quizData.index),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(right: 50.0),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              onPressed: () {
                                quizData.nextQuestion(extractedData.length);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Next',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                  const SizedBox(width: 5),
                                  const Icon(Icons.keyboard_double_arrow_right,
                                      color: Colors.black, size: 30)
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              );
            }
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20.0),
                  Text(
                    'Please Wait while Questions are loading..',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.none,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            );
          }

          return const Center(
            child: Text('No Data'),
          );
        },
      );
    });
  }
}
