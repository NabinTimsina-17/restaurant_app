import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant_application/reception_flow/change_status.dart';
import 'package:restaurant_application/reception_flow/notification_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> tables = [
    {"table": "Table 01", "status": "Empty", "color": Colors.green[100]},
    {"table": "Table 02", "status": "To Clean", "color": Colors.red[100]},
    {"table": "Table 03", "status": "Order Placed", "color": Colors.yellow[100]},
    {"table": "Table 04", "status": "Occupied", "color": Colors.blue[100]},
    {"table": "Table 05", "status": "Empty", "color": Colors.green[100]},
    {"table": "Table 06", "status": "Empty", "color": Colors.green[100]},
    {"table": "Table 07", "status": "Empty", "color": Colors.green[100]},
    {"table": "Table 08", "status": "Empty", "color": Colors.green[100]},
    {"table": "Table 09", "status": "Empty", "color": Colors.green[100]},
    {"table": "Table 10", "status": "Empty", "color": Colors.green[100]},
    {"table": "Table 11", "status": "Empty", "color": Colors.green[100]},
    {"table": "Table 12", "status": "Empty", "color": Colors.green[100]},
  ];

  String? selectedStatus;

  // Function to filter tables based on the selected status
  List<Map<String, dynamic>> get filteredTables {
    if (selectedStatus == null) {
      return tables;
    }
    return tables.where((table) => table['status'] == selectedStatus).toList();
  }

  // Function to count the number of tables for a specific status
  int countTablesByStatus(String status) {
    return tables.where((table) => table['status'] == status).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        elevation: 0,
        title: Row(
          children: [
            DropdownButton<String>(
              value: 'EN',
              items: <String>['EN', 'FR', 'ES'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  var dropdownvalue = newValue!;
                });
              },
            ),
            const Spacer(),
            IconButton(
              icon: Stack(
                children: <Widget>[
                  const Icon(Icons.notifications, color: Colors.white),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: const Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Row(
              children: [
                const Text('Restaurant Tables',
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.w400)),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _filterButton('Occupied', countTablesByStatus('Occupied')),
                  const SizedBox(width: 10),
                  _filterButton('Empty', countTablesByStatus('Empty')),
                  const SizedBox(width: 10),
                  _filterButton('To Clean', countTablesByStatus('To Clean')),
                  const SizedBox(width: 10),
                  _filterButton(
                      'Order Placed', countTablesByStatus('Order Placed')),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.2,
              ),
              itemCount: filteredTables.length,
              itemBuilder: (context, index) {
                return _tableCard(
                  filteredTables[index]['table'],
                  filteredTables[index]['status'],
                  filteredTables[index]['color'],
                  index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Filter Button Widget
  Widget _filterButton(String label, int count) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            selectedStatus == label ? Colors.blue : Colors.white, // Highlight selected button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: const BorderSide(color: Colors.grey),
        elevation: 0,
      ),
      onPressed: () {
        setState(() {
          // Set the selected status for filtering
          if (selectedStatus == label) {
            selectedStatus = null; // Deselect if already selected
          } else {
            selectedStatus = label;
          }
        });
      },
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: selectedStatus == label ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(width: 5),
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.grey[300],
            child: Text(
              count.toString(),
              style: const TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  // Table Card Widget
  Widget _tableCard(String table, String status, Color? color, int index) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                table,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Icon(
                Icons.info_outline,
                color: Colors.grey[600],
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text('Status:', style: TextStyle(color: Colors.black54)),
          DropdownButton<String>(
            value: status,
            isExpanded: true,
            onChanged: (String? newValue) async {
              if (newValue != null) {
                // Navigate to ChangeStatusScreen for confirmation
                final bool? result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeStatusScreen(
                        tableName: table, newStatus: newValue),
                  ),
                );

                // If user confirms, update status and show toast
                if (result == true) {
                  setState(() {
                    tables[index]['status'] = newValue;
                  });

                  Fluttertoast.showToast(
                    msg: "$table is now $newValue",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              }
            },
            items: <String>['Empty', 'To Clean', 'Order Placed', 'Occupied']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
