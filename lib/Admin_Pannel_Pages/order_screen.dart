import 'package:flutter/material.dart';
import 'package:test_delete/Admin_Pannel_Pages/adminpanel_screen.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<Map<String, String>> orders = [
    {
      'status': 'Processing',
      'date': '01 Sep 2023',
      'orderId': 'CWT0012',
      'shippingDate': '09 Sep 2023',
    },
    {
      'status': 'Shipment on the way',
      'date': '02 Oct 2023',
      'orderId': 'CWT0025',
      'shippingDate': '06 Oct 2023',
    },
    {
      'status': 'Processing',
      'date': '02 Oct 2023',
      'orderId': 'CWT0025',
      'shippingDate': '06 Oct 2023',
    },
    {
      'status': 'Delivered',
      'date': '02 Oct 2023',
      'orderId': 'CWT0025',
      'shippingDate': '06 Oct 2023',
    },
    {
      'status': 'Delivered',
      'date': '02 Oct 2023',
      'orderId': 'CWT0025',
      'shippingDate': '06 Oct 2023',
    },
    {
      'status': 'Cancelled',
      'date': '02 Oct 2023',
      'orderId': 'CWT0025',
      'shippingDate': '06 Oct 2023',
    },
    // Add more orders as needed
  ];

  void deleteOrder(int index) {
    setState(() {
      orders.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF749F29),
        title: const Text(
          "Orders Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Admin_Pannel(),
              ),
            );
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return _buildOrderCard(
            status: order['status']!,
            date: order['date']!,
            orderId: order['orderId']!,
            shippingDate: order['shippingDate']!,
            color: _getStatusColor(order['status']!),
            onDelete: () => deleteOrder(index),
          );
        },
      ),
    );
  }

  Widget _buildOrderCard({
    required String status,
    required String date,
    required String orderId,
    required String shippingDate,
    required Color color,
    required VoidCallback onDelete,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.date_range, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text(date),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text('Order: $orderId'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.local_shipping, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text('Shipping Date: $shippingDate'),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Processing':
        return Colors.blue;
      case 'Shipment on the way':
        return Colors.orange;
      case 'Delivered':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
