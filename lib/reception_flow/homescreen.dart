import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_application/reception_flow/change_status.dart';
import 'package:restaurant_application/reception_flow/notification_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant_application/reception_flow/tableprovider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tableProvider = Provider.of<TableProvider>(context);

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
                // Handle language change
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
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
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400)),
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
                  _filterButton(context, 'Occupied', tableProvider.countTablesByStatus('Occupied')),
                  const SizedBox(width: 10),
                  _filterButton(context, 'Empty', tableProvider.countTablesByStatus('Empty')),
                  const SizedBox(width: 10),
                  _filterButton(context, 'To Clean', tableProvider.countTablesByStatus('To Clean')),
                  const SizedBox(width: 10),
                  _filterButton(context, 'Order Placed', tableProvider.countTablesByStatus('Order Placed')),
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
              itemCount: tableProvider.filteredTables.length,
              itemBuilder: (context, index) {
                final table = tableProvider.filteredTables[index];
                return _tableCard(context, table['table'], table['status'], table['color'], index);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Filter Button Widget
  Widget _filterButton(BuildContext context, String label, int count) {
    final tableProvider = Provider.of<TableProvider>(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: tableProvider.selectedStatus == label
            ? Colors.blue
            : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: const BorderSide(color: Colors.grey),
        elevation: 0,
      ),
      onPressed: () {
        tableProvider.setSelectedStatus(tableProvider.selectedStatus == label ? null : label);
      },
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: tableProvider.selectedStatus == label
                  ? Colors.white
                  : Colors.black,
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
  Widget _tableCard(BuildContext context, String table, String status, Color? color, int index) {
    final tableProvider = Provider.of<TableProvider>(context, listen: false);

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
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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
                final bool? result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangeStatusScreen(
                      tableName: table, // Pass table name
                      newStatus: newValue)),  // Pass new status
                );
                if (result != null && result) {
                  tableProvider.updateTableStatus(index, newValue);
                  Fluttertoast.showToast(
                    msg: "Table status updated successfully!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                  );
                }
              }
            },
            items: <String>['Occupied', 'Empty', 'To Clean', 'Order Placed']
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
