
import 'package:flutter/material.dart';
import 'package:my_weather/widget/custom_cupertino_text_field.dart';

import 'home_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailIDController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Color bgColor = Color.fromRGBO(14, 98, 254, 1);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      color: bgColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: bgColor,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Image.asset(
                  "assets/images/man.png",
                  width: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Center(
                          child: Text(
                        "Sign Up For Weather Updates!!",
                        style:
                            textTheme.labelLarge!.copyWith(color: Colors.white),
                      )),
                    ),
                    CustomCupertinoTextField(
                      prefix: "Email ID",
                      controller: emailIDController,
                    ),
                    CustomCupertinoTextField(
                      prefix: "Password",
                      obscureText: true,
                      controller: passwordController,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: FilledButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Text("Sign Up"),
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromRGBO(225, 225, 115, 1)),
                            foregroundColor: MaterialStatePropertyAll(bgColor)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Back"),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
