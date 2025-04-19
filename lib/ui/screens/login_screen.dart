import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/ui/screens/forgot_password_verify_email_screen.dart';
import 'package:task_manager/ui/screens/register_screen.dart';
import 'package:task_manager/ui/widgets/center_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../../data/service/network_client.dart';
import '../../data/utils/urls.dart';
import '../utils/asstes_path.dart';
import '../widgets/snack_bar_message.dart';
import 'bottom_nav_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _signInProgress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
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
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailTextEditingController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  validator: (String? value) {
                    String email = value?.trim() ?? '';
                    if (EmailValidator.validate(email) == false) {
                      return 'please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _passwordTextEditingController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  validator: (String? value) {
                    final RegExp passwordRegex =
                        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$');

                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (!passwordRegex.hasMatch(value)) {
                      return 'Password must be at least 6 characters and include letters and numbers';
                    }

                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Visibility(
                  visible: _signInProgress == false,
                  replacement: CenterCircularProgressIndicator(),
                  child: ElevatedButton(
                    onPressed: _onTapSignInButton,
                    child: Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.white,
                    ),
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
                            TextSpan(
                              text: "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = _onTapSignUpButton,
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
      ),
    );
  }

  void _onTapSignInButton() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavScreen(),
        ),
        (predicate) => false);
  }

  void _onTapForgotPassButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ForgotPasswordVerifyScreen(),
      ),
    );
  }

  void _onTapSignUpButton() {
    if(_formKey.currentState!.validate()){
    _login();
    }
  }

  Future<void> _login() async {
    _signInProgress = true;
    setState(() {});
    Map<String, dynamic> requestBody = {
      'email': _emailTextEditingController.text.trim(),
      'password': _passwordTextEditingController.text.trim(),
    };
    NetworkResponse response =
        await NetworkClient.postRequest(url: Urls.logInUrl, body: requestBody);

    _signInProgress = false;
    setState(() {});

    if (response.isSuccess) {
      showSnackBar(context, 'logged in');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        ),
      );
    } else {
      showSnackBar(context, response.errorMessage, true);
    }
  }
}
