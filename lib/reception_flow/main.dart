import 'package:flutter/material.dart';
import 'package:restaurant_application/reception_flow/signin_page.dart';
import 'package:restaurant_application/reception_flow/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
     
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const SignInPage(), 
      },
    );
  }
}