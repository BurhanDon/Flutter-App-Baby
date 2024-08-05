import 'package:flutter/material.dart';
import 'package:test_delete/models/product.dart';
import 'package:test_delete/pages/screens/Components/bottomnavbar_widget.dart';
import 'package:test_delete/pages/screens/Components/custom_fab.dart';
import 'package:test_delete/pages/screens/Main_Page.dart';
import 'package:test_delete/pages/screens/detail_screen.dart';
import 'package:test_delete/pages/screens/product_card.dart';

class BabyfoodPage extends StatefulWidget {
  const BabyfoodPage({super.key});

  @override
  State<BabyfoodPage> createState() => _BabyfoodPageState();
}

class _BabyfoodPageState extends State<BabyfoodPage> {
  // Dummy product list
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Baby Jams',
      description: 'Delicious jams for your baby.',
      price: 19.00,
      rating: 4.5,
      imageUrl: 'lib/assets/images/baby food.jpg',
    ),
    Product(
      id: '2',
      name: 'Feeder',
      description: 'A reliable feeder for your baby.',
      price: 23.00,
      rating: 4.3,
      imageUrl: 'lib/assets/images/feeder.jpg',
    ),
    Product(
      id: '3',
      name: 'Break Fast',
      description: 'Nutritious breakfast for your baby.',
      price: 10.00,
      rating: 4.6,
      imageUrl: 'lib/assets/images/food 1.png',
    ),
    Product(
      id: '4',
      name: 'Vegetables',
      description: 'Fresh vegetables for your baby.',
      price: 35.00,
      rating: 4.7,
      imageUrl: 'lib/assets/images/food 3.png',
    ),
    Product(
      id: '5',
      name: 'Fruits',
      description: 'Healthy fruits for your baby.',
      price: 31.00,
      rating: 4.8,
      imageUrl: 'lib/assets/images/food 4.png',
    ),
    Product(
      id: '6',
      name: 'Salads',
      description: 'Fresh salads for your baby.',
      price: 35.00,
      rating: 4.6,
      imageUrl: 'lib/assets/images/food 5.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(
          child: Text(
            'Baby Foods',
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
          )
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
        currentIndex: 1,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CustomFAB(),
    );
  }
}
