import 'package:flutter/material.dart';
import 'package:test_delete/Admin_Pannel_Pages/admin.dart';
import 'package:test_delete/Admin_Pannel_Pages/category_screen.dart';
import 'package:test_delete/Admin_Pannel_Pages/product_screen.dart';
import 'package:test_delete/Admin_Pannel_Pages/setting_screen.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: const Color(0xFF749F29),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Row(
                  children: [
                    _buildSliderText('Dashboard', const Admin_Pannel()),
                    _buildSliderText('Category', const CategoryPage()),
                    _buildSliderText('Product', const ProductPage()),
                    _buildSliderText('Order', const OrderPage()),
                    _buildSliderText('Settings', const SettingPage()),
                  ],
                ),
              ),
            ),
          ),
          _buildOrderSection('1', 'Raqeeb Uddin', context),
          _buildOrderSection('2', 'Abbas', context),
          // Add more sections as needed...
        ],
      ),
    );
  }

  Widget _buildSliderText(String text, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        margin: const EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSection(String number, String name, BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the order details page
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  OrderDetailsPage(orderNumber: number, orderName: name)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(number,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Text(name,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            const Row(
              children: [
                Icon(Icons.delete, color: Colors.red),
                SizedBox(width: 16),
                Icon(Icons.delivery_dining, color: Colors.blue),
                SizedBox(width: 16),
                Icon(Icons.remove_red_eye, color: Color(0xFF749F29)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OrderDetailsPage extends StatelessWidget {
  final String orderNumber;
  final String orderName;

  OrderDetailsPage({required this.orderNumber, required this.orderName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Detail'),
        backgroundColor: const Color(0xFF749F29),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'View Order',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Order ID: $orderNumber',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Shipped To',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Name: $orderName'),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('City: Karachi'),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Lane: Home'),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Phone Number: +92 3101242766'),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Postal Code: 12345'),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Product',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Subtotal: \$90.00'),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Discount: \$10.00'),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Shipping: \$5.00'),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Total: \$80',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
