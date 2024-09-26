import 'package:flutter/material.dart';
import 'package:restaurant_application/admin_flow/food_menu.dart';
import 'package:restaurant_application/admin_flow/main.dart';

class AdminNotificationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'table': 'Table no 1 Has Placed an order',
      'time': '3 minutes ago',
      'quantity': '4',
      'amount': '\$12',
      'status': 'order',
    },
    {
      'table': 'Table no 5 Has paid the bills',
      'time': '4 minutes ago',
      'quantity': '1',
      'amount': '\$10',
      'status': 'paid',
    },
    {
      'table': 'Table no 4 Has Placed an order',
      'time': '10 minutes ago',
      'quantity': '2',
      'amount': '\$6',
      'status': 'order',
    },
    {
      'table': 'Table no 5 called the waiter',
      'time': '10 minutes ago',
      'quantity': '',
      'amount': '',
      'status': 'called',
    }
  ];

  AdminNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FoodMenuScreen()),
            );
          },
        ),
        title: Text(
          'Notification Screen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return NotificationCard(
                    table: notifications[index]['table'],
                    time: notifications[index]['time'],
                    quantity: notifications[index]['quantity'],
                    amount: notifications[index]['amount'],
                    status: notifications[index]['status'],
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FoodMenuApp()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Back',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String table;
  final String time;
  final String quantity;
  final String amount;
  final String status;

  const NotificationCard({
    super.key,
    required this.table,
    required this.time,
    required this.quantity,
    required this.amount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/friedhotchicken.png', 
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  table,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      time,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    if (quantity.isNotEmpty)
                      Text(
                        '   Quantity: $quantity',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                  ],
                ),
                if (amount.isNotEmpty)
                  Text(
                    'Amount: $amount',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
              ],
            ),
          ),
          SizedBox(width: 8),
          Icon(
            _getStatusIcon(),
            color: _getStatusColor(),
            size: 16,
          ),
        ],
      ),
    );
  }

  IconData _getStatusIcon() {
    switch (status) {
      case 'paid':
        return Icons.check_circle;
      case 'called':
        return Icons.notifications_active;
      case 'order':
      default:
        return Icons.shopping_cart;
    }
  }

  Color _getStatusColor() {
    switch (status) {
      case 'paid':
        return Colors.green;
      case 'called':
        return Colors.orange;
      case 'order':
      default:
        return Colors.grey;
    }
  }
}
