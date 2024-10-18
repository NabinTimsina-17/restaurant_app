import 'package:flutter/material.dart';

class TableProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _tables = [
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

  List<Map<String, dynamic>> get tables => _tables;

  // Get filtered tables based on selected status
  List<Map<String, dynamic>> get filteredTables {
    if (selectedStatus == null) {
      return _tables;
    }
    return _tables.where((table) => table['status'] == selectedStatus).toList();
  }

  // Count tables by status
  int countTablesByStatus(String status) {
    return _tables.where((table) => table['status'] == status).length;
  }

  // Function to update table status
  void updateTableStatus(int index, String newStatus) {
    _tables[index]['status'] = newStatus;
    notifyListeners();
  }

  // Set selected status for filtering
  void setSelectedStatus(String? status) {
    selectedStatus = status;
    notifyListeners();
  }
}
