import 'package:flutter/material.dart';
import 'package:restaurant_application/kitchen_flow/order_detail.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, String>> orders = [
    {"table": "Table 01", "time": "2:00PM", "items": "3 Items"},
    {"table": "Table 01", "time": "2:00PM", "items": "3 Items"},
    {"table": "Table 01", "time": "2:00PM", "items": "3 Items"},
  ];

  NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text('Order List'),
        actions: [
          IconButton(
            icon: const Stack(
              children: [
                Icon(Icons.notifications_none),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            return OrderCard(
              tableName: orders[index]['table']!,
              orderTime: orders[index]['time']!,
              itemCount: orders[index]['items']!,
            );
          },
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String tableName;
  final String orderTime;
  final String itemCount;

  const OrderCard({
    super.key,
    required this.tableName,
    required this.orderTime,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$tableName placed an Order!',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              itemCount,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Placed at: $orderTime',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderDetailScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text('View Order'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
