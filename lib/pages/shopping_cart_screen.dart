import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_delete/pages/screens/Main_Page.dart';
import 'package:test_delete/pages/screens/checkout_screen.dart';
import 'package:url_launcher/url_launcher.dart';
class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  bool isItemAddedToCart = true; // Assume items are added for demonstration

  List<CartItemData> cartItems = [
    CartItemData(
      productName: 'Baby Toys',
      price: 45.00,
      quantity: 1,
      imagePath: 'lib/assets/images/downloaddd.png',
    ),
    CartItemData(
      productName: 'Baby Diapers',
      price: 30.00,
      quantity: 1,
      imagePath: 'lib/assets/images/downloaddd.png',
    ),
    // Add more CartItemData as needed
  ];

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF749F29),
        elevation: 0,
        title: const Center(
          child: Text(
            'Shopping Cart',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MainPageScreen()),
            );
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Row(
              children: [
                Icon(Icons.shopping_basket_outlined, color: Colors.white),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItem(
                  cartItemData: cartItems[index],
                  onDelete: () {
                    setState(() {
                      cartItems.removeAt(index);
                    });
                  },
                  onQuantityChange: (newQuantity) {
                    setState(() {
                      cartItems[index].quantity = newQuantity;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$$totalPrice',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF4911A),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckOutPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF749F29),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Checkout',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const BottomNavBar(
      //   currentIndex: 2, // Cart index
      //   excludeItems: ['orders'], // Remove reviews icon
      // ),
    );
  }
}

class CartItem extends StatelessWidget {
  final CartItemData cartItemData;
  final VoidCallback onDelete;
  final ValueChanged<int> onQuantityChange;

  CartItem({
    required this.cartItemData,
    required this.onDelete,
    required this.onQuantityChange,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(cartItemData.imagePath),
            ),
          ),
        ),
        title: Text(cartItemData.productName),
        subtitle: Text('Price: \$${cartItemData.price}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                onQuantityChange(max(1, cartItemData.quantity - 1));
              },
            ),
            Text('${cartItemData.quantity}'),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                onQuantityChange(cartItemData.quantity + 1);
              },
            ),
            const SizedBox(width: 16),
            IconButton(
              icon: const Icon(Icons.clear, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemData {
  final String productName;
  final double price;
  int quantity;
  final String imagePath;

  CartItemData({
    required this.productName,
    required this.price,
    required this.quantity,
    required this.imagePath,
  });
}

class CheckoutPage extends StatelessWidget {
  final List<CartItemData> cartItems;

  CheckoutPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: const Column(
        children: [
          // Implement your checkout UI here
          // Use cartItems for displaying the selected items
        ],
      ),
    );
  }
}
