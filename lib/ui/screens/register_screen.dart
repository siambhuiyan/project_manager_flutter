import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/data/service/network_client.dart';
import 'package:task_manager/ui/screens/login_screen.dart';
import 'package:task_manager/ui/widgets/center_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

import '../../data/utils/urls.dart';
import '../utils/asstes_path.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _firstNameTextEditingController =
      TextEditingController();
  final TextEditingController _lastNameTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _mobileTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _registrationInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ScreenBackground(
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
                    'Join With Us',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: _emailTextEditingController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
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
                    textInputAction: TextInputAction.next,
                    controller: _firstNameTextEditingController,
                    decoration: InputDecoration(
                      hintText: 'First Name',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'please enter a valid first name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _lastNameTextEditingController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                    ),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'please enter a valid last name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _mobileTextEditingController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Mobile',
                    ),
                    validator: (String? value) {
                      String mobile = value?.trim() ?? '';
                      final RegExp bdPhoneRegex =
                          RegExp(r'^(?:\+8801|01)[3-9]\d{8}$');
                      if (bdPhoneRegex.hasMatch(mobile) == false) {
                        return 'please enter a valid mobile';
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
                    visible: _registrationInProgress == false,
                    replacement: CenterCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: _onTapSubmit,
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
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(text: "Already have an account? "),
                              TextSpan(
                                text: "Sign In",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.greenAccent,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = _onTapSignInButton,
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
      ),
    );
  }

  void _onTapSubmit() {
    if (_formKey.currentState!.validate()) {
      _registerUser();
    }
  }

  Future<void> _registerUser() async {
    _registrationInProgress = true;
    setState(() {});
    Map<String, dynamic> requestBody = {
      'email': _emailTextEditingController.text.trim(),
      'firsName': _firstNameTextEditingController.text.trim(),
      'lastName': _lastNameTextEditingController.text.trim(),
      'mobile': _mobileTextEditingController.text.trim(),
      'password': _passwordTextEditingController.text.trim(),
    };
    NetworkResponse response = await NetworkClient.postRequest(
        url: Urls.registerUrl, body: requestBody);

    _registrationInProgress = false;
    setState(() {});

    if (response.isSuccess) {
      showSnackBar(context, 'User registered successfully!');
      _clearTextField();
    } else {
      showSnackBar(context, response.errorMessage, true);
    }
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  void _clearTextField() {
    _emailTextEditingController.clear();
    _firstNameTextEditingController.clear();
    _lastNameTextEditingController.clear();
    _passwordTextEditingController.clear();
    _mobileTextEditingController.clear();
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _mobileTextEditingController.dispose();
    _firstNameTextEditingController.dispose();
    _lastNameTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }
}
