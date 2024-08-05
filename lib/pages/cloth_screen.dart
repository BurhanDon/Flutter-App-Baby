import 'package:flutter/material.dart';
import 'package:test_delete/models/product.dart';
import 'package:test_delete/pages/screens/Components/bottomnavbar_widget.dart';
import 'package:test_delete/pages/screens/Components/custom_fab.dart';
import 'package:test_delete/pages/screens/Main_Page.dart';
import 'package:test_delete/pages/screens/detail_screen.dart';
import 'package:test_delete/pages/screens/product_card.dart';

class ClothPage extends StatefulWidget {
  const ClothPage({super.key});

  @override
  State<ClothPage> createState() => _ClothPageState();
}

class _ClothPageState extends State<ClothPage> {
  // Dummy product list
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Cloth 1',
      description: 'Comfortable cloth for your baby.',
      price: 15.00,
      rating: 4.5,
      imageUrl: 'lib/assets/images/feeder.jpg',
    ),
    Product(
      id: '2',
      name: 'Stuffed Bear',
      description: 'Soft stuffed bear for your baby.',
      price: 20.00,
      rating: 4.3,
      imageUrl: 'lib/assets/images/bear.png',
    ),
    Product(
      id: '3',
      name: 'Toy Car',
      description: 'Colorful toy car for your baby.',
      price: 10.00,
      rating: 4.6,
      imageUrl: 'lib/assets/images/babycar.png',
    ),
    Product(
      id: '4',
      name: 'Doll House',
      description: 'Charming doll house for your baby.',
      price: 35.00,
      rating: 4.7,
      imageUrl: 'lib/assets/images/wodehouse.png',
    ),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(
          child: Text(
            'Child Cloths',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainPageScreen(),
              ),
            );
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Row(
              children: [
                Icon(Icons.shopping_basket_outlined, color: Colors.black),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 13, bottom: 20.0),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _products.map((product) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: ProductCard(
                  product: product,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(product: product),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        currentIndex: 0, // Adjust according to your bottom nav index
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CustomFAB(),
    );
  }
}
