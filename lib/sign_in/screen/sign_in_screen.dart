import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/sign_up/screen/sign_up_screen.dart';

import '../../reusable_widgets/reusable_text_form_field.dart';
import '../sign_in_vm/sign_in_provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late ImageProvider image;

  @override
  void initState() {
    // TODO: implement initState
    image = const AssetImage('images/login.jpg');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInProvider>(builder: (_, signInData, child) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: image, fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 35,
                          top: MediaQuery.of(context).size.height * 0.28),
                      child: Text('Welcome \nBack',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 35, right: 35),
                            child: Column(
                              children: [
                                reusableTextFormField(
                                    textController:
                                        signInData.usernameController,
                                    text: 'Enter Email ID',
                                    icon: Icons.email_outlined,
                                    isPasswordType: false),
                                const SizedBox(
                                  height: 30,
                                ),
                                reusableTextFormField(
                                    textController:
                                        signInData.passwordController,
                                    text: 'Enter Password',
                                    icon: Icons.lock_open,
                                    isPasswordType: true),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Sign In',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    CircleAvatar(
                                      radius: 41,
                                      backgroundColor: Colors.black,
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Colors.grey.shade100
                                            .withOpacity(0.9),
                                        child: IconButton(
                                            onPressed: () {
                                              signInData.signInMethod();
                                            },
                                            icon: const Icon(
                                              Icons.arrow_right_alt,
                                              size: 50,
                                              color: Colors.black,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SignUpScreen()));
                                      },
                                      child: Text(
                                        'Sign Up',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                      ),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
