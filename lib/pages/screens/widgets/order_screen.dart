// import 'package:flutter/material.dart';
//
// class OrderDetailsPage extends StatelessWidget {
//   final String orderNumber;
//
//   OrderDetailsPage({required this.orderNumber});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order Details'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Display order details here
//           _buildOrderDetails(context),
//           SizedBox(height: 20),
//           // Display order tracking information
//           _buildOrderTracking(context),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildOrderDetails(BuildContext context) {
//     // Implement order details UI here
//     return Container(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Order Number: $orderNumber', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           // Add more order details as needed
//         ],
//       ),
//     );
//   }
//
//   Widget _buildOrderTracking(BuildContext context) {
//     // Implement order tracking UI here
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Order Tracking', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           SizedBox(height: 10),
//           // Implement real-time order tracking UI using web_socket_channel or other mechanisms
//           // You may want to consider using a third-party package for this
//           // For simplicity, we'll use a basic text representation
//           Text('Order status: Out for delivery'),
//           Text('Estimated delivery time: 30 minutes'),
//         ],
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';

import '../Main_Page.dart';

void main() {
  runApp(MaterialApp(
    home: OrderHistoryScreen(),
  ));
}

class OrderHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF749F29),
        title: const Text('Order History'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainPageScreen(),),);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: orderHistory.length,
        itemBuilder: (context, index) {
          return OrderHistoryItem(order: orderHistory[index]);
        },
      ),
    );
  }
}

class OrderHistoryItem extends StatelessWidget {
  final Order order;

  OrderHistoryItem({required this.order});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Order #${order.orderNumber}'),
      subtitle: Text('Status: ${order.status}'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(order: order),
          ),
        );
      },
    );
  }
}

class OrderDetailsScreen extends StatelessWidget {
  final Order order;

  OrderDetailsScreen({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF749F29),
        title: const Text('Order Details'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const MainPageScreen(),),);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Order #${order.orderNumber}'),
            subtitle: Text('Status: ${order.status}'),
          ),
          const Divider(),
          const ListTile(
            title: Text('Items Purchased'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: order.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(order.items[index].name),
                subtitle: Text('Price: \$${order.items[index].price.toString()}'),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Order {
  final String orderNumber;
  final String status;
  final List<OrderItem> items;

  Order({
    required this.orderNumber,
    required this.status,
    required this.items,
  });
}

class OrderItem {
  final String name;
  final double price;

  OrderItem({required this.name, required this.price});
}

// Dummy data for testing
List<Order> orderHistory = [
  Order(
    orderNumber: '123456',
    status: 'Delivered',
    items: [
      OrderItem(name: 'Baby Toys', price: 90.0),
      OrderItem(name: 'Product B', price: 30.0),
    ],
  ),
  Order(
    orderNumber: '789012',
    status: 'Pending',
    items: [
      OrderItem(name: 'Product C', price: 25.0),
    ],
  ),
];
