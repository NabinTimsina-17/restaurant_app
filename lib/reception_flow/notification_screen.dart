import 'package:flutter/material.dart';
import 'package:restaurant_application/reception_flow/homescreen.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'table': 'Table no 1',
      'status': 'Has Placed an order',
      'time': '3 minutes ago',
      'quantity': 4,
      'amount': 12,
      'type': 'order',
    },
    {
      'table': 'Table no 5',
      'status': 'Has payed the bills',
      'time': '4 minutes ago',
      'quantity': 1,
      'amount': 10,
      'type': 'payment',
    },
    {
      'table': 'Table no 4',
      'status': 'Has Placed an order',
      'time': '10 minutes ago',
      'quantity': 2,
      'amount': 6,
      'type': 'order',
    },
  ];

  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Notification Screen'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage:
                    AssetImage('assets/images/friedhotchicken.png'),
              ),
              title: Text(
                '${notification['table']} ${notification['status']}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification['time']),
                  Text('Quantity: ${notification['quantity']}'),
                  if (notification['type'] == 'order')
                    Text('Amount: \$${notification['amount']}')
                  else
                    Text('Amount Received: \$${notification['amount']}'),
                ],
              ),
              trailing: notification['type'] == 'payment'
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : const Icon(Icons.info, color: Colors.grey),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          child: const Text('Back'),
        ),
      ),
    );
  }
}
