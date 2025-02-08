import 'package:appflutter/feature/Ath/pages/login.dart';
import 'package:appflutter/feature/Ath/pages/otp.dart';
import 'package:appflutter/feature/Ath/pages/register.dart';
import 'package:appflutter/feature/Ath/pages/verfy.dart';
import 'package:appflutter/feature/appPages/pages/homepage.dart';
import 'package:appflutter/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Login(),
        routes: {
        '/login': (context) => const Login(),
        'register': (context) => const Register(),
        'home': (context) =>const Homepage(),
        'otp': (context) =>const Otp(),
        'verify': (context) =>const Verifyemail(),
      },
    
    );
  }
}


  
