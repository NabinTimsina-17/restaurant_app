import 'package:flutter/material.dart';
import 'package:restaurant_application/admin_flow/notification_page.dart';

class FoodMenuScreen extends StatefulWidget {
  const FoodMenuScreen({super.key});

  @override
  FoodMenuScreenState createState() => FoodMenuScreenState();
}

class FoodMenuScreenState extends State<FoodMenuScreen> {
  final List<Map<String, dynamic>> foodItems = [
    {
      'name': 'Fried Hot Chicken',
      'price': 16.22,
      'description': 'Savory stir-fried noodles tossed with tender chicken, crisp vegetables.',
      'image': 'assets/images/friedhotchicken.png',
    },
    {
      'name': 'Oatmeal Breakfast',
      'price': 16.22,
      'description': 'Savory stir-fried noodles tossed with tender chicken, crisp vegetables.',
      'image': 'assets/images/oatmeal.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.language, color: Colors.grey[600], size: 16),
            ),
            SizedBox(width: 8),
            Text('EN', style: TextStyle(color: Colors.black)),
            Icon(Icons.arrow_drop_down, color: Colors.black),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.call, color: Colors.black),
              label: Text('Call Waiter', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(width: 8),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.receipt, color: Colors.black),
              label: Text('Receipt', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryTab(title: 'Appetizers', isActive: true),
                  CategoryTab(title: 'Entrees', isActive: false),
                  CategoryTab(title: 'Sides', isActive: false),
                  CategoryTab(title: 'Desserts', isActive: false),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                return FoodItemCard(
                  imageUrl: foodItems[index]['image'],
                  title: foodItems[index]['name'],
                  description: foodItems[index]['description'],
                  price: foodItems[index]['price'],
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.green[50],
            child: Row(
              children: [
                Text(
                  '1 Item Selected',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                     Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>  AdminNotificationScreen()),
                    );
                  },
                  child: Text(
                    'View Order',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryTab extends StatelessWidget {
  final String title;
  final bool isActive;

  const CategoryTab({super.key, required this.title, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: isActive ? Colors.white : Colors.black,
          backgroundColor: isActive ? Colors.green : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: isActive ? 2 : 0,
          side: isActive ? null : BorderSide(color: Colors.grey),
        ),
        child: Text(title),
      ),
    );
  }
}

class FoodItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double price;

  const FoodItemCard({super.key, 
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              imageUrl,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.info_outline),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.restaurant_menu),
                      onPressed: () {},
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                      
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(8),
                      ),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
