import 'package:flutter/material.dart';
import 'package:restaurant_application/kitchen_flow/order_list_screen.dart';

void main() {
  runApp(const OrderListApp());
}

class OrderListApp extends StatelessWidget {
  const OrderListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OrderListScreen(),
    );
  }
}
