import 'package:flutter/material.dart';

class ChangeStatusScreen extends StatelessWidget {
  final String tableName;
  final String newStatus;

  const ChangeStatusScreen({super.key, required this.tableName, required this.newStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Status Change'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Are you sure you want to change the status?',
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Displaying table and status information with better styling
              Text(
                'Table: $tableName\nNew Status: $newStatus',
                style: TextStyle(
                  fontSize: 18,
                  color: _getStatusColor(newStatus),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // Action buttons with distinct colors for confirm and cancel
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Confirm color
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Cancel color
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // A function to determine the color based on the status type
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Occupied':
        return Colors.green;
      case 'Empty':
        return Colors.blue;
      case 'To Clean':
        return Colors.red;
      case 'Order Placed':
        return Colors.orange;
      default:
        return Colors.black;
    }
  }
}
