import 'package:flutter/material.dart';
import 'package:restaurant_application/admin_flow/food_menu.dart';

void main() {
  runApp(FoodMenuApp());
}

class FoodMenuApp extends StatelessWidget {
  const FoodMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodMenuScreen(),
    );
  }
}