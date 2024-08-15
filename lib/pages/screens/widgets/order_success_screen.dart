import 'package:flutter/material.dart';
import 'package:test_delete/pages/screens/Components/bottomnavbar_widget.dart';
import 'package:test_delete/pages/screens/widgets/search_page_screen.dart';

import '../../shopping_cart_screen.dart';
import '../Components/profile_screen.dart';
import 'order_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Successful Animation',
      theme: ThemeData(

      ),
      home: OrderSuccessPage(),
    );
  }
}

class OrderSuccessPage extends StatefulWidget {
  @override
  _OrderSuccessPageState createState() => _OrderSuccessPageState();
}

class _OrderSuccessPageState extends State<OrderSuccessPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1, end: 2).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF749F29),
        elevation: 0,
        title: const Center(
          child: Text(
            'Orders Completed..!',
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
              MaterialPageRoute(builder: (context) => ShoppingCart()),
            );
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Row(
              children: [
                Icon(Icons.shopping_basket_outlined),
              ],
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 100.0,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Order Successfully Placed!',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
       bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}
