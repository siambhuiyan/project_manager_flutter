import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/screens/bottom_nav_screen.dart';
import 'package:task_manager/ui/screens/login_screen.dart';
import 'package:task_manager/ui/utils/asstes_path.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nextPage();
  }

  //move to next screen
  Future<void> _nextPage() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    //checked if user logged in
    final bool isLoggedIn = await AuthController.checkedIfUserLoggedIn();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            isLoggedIn ? const BottomNavScreen() : const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackground(
      child: Center(
        child: SvgPicture.asset(
          AssetsPath.logoSvg,
          width: 120,
        ),
      ),
    ));
  }
}
