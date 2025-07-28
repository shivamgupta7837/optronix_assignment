import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:optronix_assignment/services/share_pref/share_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/splash_screen_logo.png", height: 300),
             ],
        ),
      ),
    );
  }

  void whereToGo() async {
    bool? isLoggedIn = await SharePreference.instance.isUserLogin();
    print("is login: $isLoggedIn");
    print(isLoggedIn);
    if (isLoggedIn != null) {
      if (isLoggedIn == true) {
        Timer(
          const Duration(seconds: 1),
          () =>      Navigator.pushReplacementNamed(context, '/home')
        );
      } else {
        Timer(
          const Duration(seconds: 1),
          () =>  Navigator.pushReplacementNamed(context, '/login')
        );
      }
    } else {
      Timer(
        const Duration(seconds: 3),
        () =>  Navigator.pushReplacementNamed(context, '/login')
      );
    }
  }
}
