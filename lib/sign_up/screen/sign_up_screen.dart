import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/sign_in/screen/sign_in_screen.dart';

import '../../reusable_widgets/reusable_text_form_field.dart';
import '../sign_in_vm/sign_up_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late ImageProvider image;

  @override
  void initState() {
    // TODO: implement initState
    image = const AssetImage('images/signup.jpg');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpProvider>(builder: (_, signUpData, child) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: image, fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 35,
                          top: MediaQuery.of(context).size.height * 0.02),
                      child: Text('Create \nAccount',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 35, right: 35),
                            child: Column(
                              children: [
                                reusableTextFormField(
                                    textController:
                                        signUpData.usernameController,
                                    text: 'Enter Username',
                                    icon: Icons.person,
                                    isPasswordType: false),
                                const SizedBox(
                                  height: 30,
                                ),
                                reusableTextFormField(
                                    textController: signUpData.emailController,
                                    text: 'Enter Email ID',
                                    icon: Icons.email,
                                    isPasswordType: false),
                                const SizedBox(
                                  height: 30,
                                ),
                                reusableTextFormField(
                                    textController:
                                        signUpData.passwordController,
                                    text: 'Enter Password',
                                    icon: Icons.lock,
                                    isPasswordType: true),
                                const SizedBox(
                                  height: 40,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Sign Up',
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
                                              signUpData.signUpMethod();
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
                                  height: 40,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignInScreen()));
                                    },
                                    child: Text(
                                      'Sign In',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ),
                                  ),
                                )
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
