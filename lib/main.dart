import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:school_phone/screens/home/home_screen.dart';
import 'package:school_phone/screens/rate/rate_screen.dart';
import 'package:school_phone/screens/splash/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Phone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}


