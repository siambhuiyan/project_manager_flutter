import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../utils/asstes_path.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Text(
                'Get Started With',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: _onTapForgotPassButton,
                      child: Text("Forgot Password?"),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(text: "Don't have account? "),
                          TextSpan(text: "Sign In" , style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent,
                          ),
                            recognizer: TapGestureRecognizer()..onTap = _onTapSignInButton,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void _onTapForgotPassButton(){}
  void _onTapSignInButton(){}
}
