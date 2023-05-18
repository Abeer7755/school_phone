import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_phone/screens/auth/login/login_screen.dart';
import 'package:school_phone/screens/home/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();

    Timer(
        const Duration(
          seconds: 4,
        ),
            () => FirebaseAuth.instance.authStateChanges().listen((User? user) {
                if (user == null) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => const LoginScreen(),
                    ),
                  );
                } else {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) =>  HomeScreen(),),
                  );
                }
              }),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/school.png',width: 120,height: 120,),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'School App',
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: LinearProgressIndicatorDemo(),
            )
          ],
        ),
      ),
    );
  }
}

class LinearProgressIndicatorDemo extends StatefulWidget {
  const LinearProgressIndicatorDemo({Key? key}) : super(key: key);

  @override
  State<LinearProgressIndicatorDemo> createState() =>
      _LinearProgressIndicatorDemoState();
}

class _LinearProgressIndicatorDemoState
    extends State<LinearProgressIndicatorDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(
          milliseconds: 3999,
        ),
        vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LinearProgressIndicator(
        value: animation.value,
      ),
    );
  }
}
