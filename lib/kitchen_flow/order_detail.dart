import 'package:flutter/material.dart';
import 'package:restaurant_application/kitchen_flow/main.dart';
import 'package:restaurant_application/kitchen_flow/notification_screen.dart';

class OrderDetailScreen extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      "item": "Fried Hot Chicken",
      "note": "Less hot but not very less, only moderate."
    },
    {"item": "Fresh Strawberry", "note": ""},
    {"item": "Oatmeal Breakfast", "note": ""},
  ];

  OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const OrderListApp()),
            );
          },
        ),
        title: const Text('Order List'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '3 Items',
                  style: TextStyle(color: Colors.red[700]),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Table 01 Order',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return OrderItem(
                    itemNumber: (index + 1).toString(),
                    itemName: items[index]['item']!,
                    customerNote: items[index]['note']!,
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Estimated Time Given to the customer is 45 mins',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  // Using pushReplacement to replace the sign in screen with the home screen
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationsScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                'Order Completed',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final String itemNumber;
  final String itemName;
  final String customerNote;

  const OrderItem({
    super.key,
    required this.itemNumber,
    required this.itemName,
    required this.customerNote,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '$itemNumber  ',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              itemName,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        if (customerNote.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text(
                'Note from the Customer',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        if (customerNote.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
            child: Text(
              customerNote,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
            ),
          ),
        const Divider(),
      ],
    );
  }
}
