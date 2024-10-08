import 'package:flutter/material.dart';
import 'package:test_delete/models/product.dart';
import 'package:test_delete/pages/screens/Components/bottomnavbar_widget.dart';
import 'package:test_delete/pages/screens/Main_Page.dart';
import 'package:test_delete/pages/screens/detail_screen.dart';
import 'package:test_delete/pages/screens/product_card.dart';

class ToysPage extends StatefulWidget {
  const ToysPage({super.key});

  @override
  State<ToysPage> createState() => _ToysPageState();
}

class _ToysPageState extends State<ToysPage> {
  // Dummy product list for demonstration purposes
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Building Blocks',
      description: 'Colorful building blocks for kids.',
      price: 15.00,
      rating: 4.5,
      imageUrl: 'lib/assets/images/toys.jpg',
    ),
    Product(
      id: '2',
      name: 'Stuffed Bear',
      description: 'Soft and cuddly stuffed bear.',
      price: 20.00,
      rating: 4.7,
      imageUrl: 'lib/assets/images/bear.png',
    ),
    Product(
      id: '3',
      name: 'Toy Car',
      description: 'Exciting toy car for children.',
      price: 10.00,
      rating: 4.6,
      imageUrl: 'lib/assets/images/babycar.png',
    ),
    Product(
      id: '4',
      name: 'Doll House',
      description: 'Beautiful doll house with furniture.',
      price: 35.00,
      rating: 4.8,
      imageUrl: 'lib/assets/images/wodehouse.png',
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
            'Child Toys',
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
        currentIndex: 2,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
            bottom: 60.0, right: 10.0, left: 10.0, top: 0.0),
        child: Transform.rotate(
          angle: -0.5,
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFF4911A),
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Transform.rotate(
                angle: 0.5,
                child: const Icon(Icons.add, size: 30, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
