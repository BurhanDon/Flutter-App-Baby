import 'package:flutter/material.dart';
import 'package:test_delete/models/product.dart';
import 'package:test_delete/pages/screens/Components/bottomnavbar_widget.dart';
import 'package:test_delete/pages/screens/Main_Page.dart';
import 'package:test_delete/pages/screens/detail_screen.dart';
import 'package:test_delete/pages/screens/product_card.dart';

class DiaperPage extends StatefulWidget {
  const DiaperPage({super.key});

  @override
  State<DiaperPage> createState() => _DiaperPageState();
}

class _DiaperPageState extends State<DiaperPage> {
  // Dummy product list for demonstration purposes
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Happy Child Boy Diaper',
      description: 'High-quality diapers for boys.',
      price: 15.00,
      rating: 4.5,
      imageUrl: 'lib/assets/images/babyboy.png',
    ),
    Product(
      id: '2',
      name: 'Tidy Diapers',
      description: 'Comfortable and tidy diapers.',
      price: 20.00,
      rating: 4.3,
      imageUrl: 'lib/assets/images/diaper 1.png',
    ),
    Product(
      id: '3',
      name: 'Baby Pampers',
      description: 'Soft and absorbent pampers.',
      price: 10.00,
      rating: 4.6,
      imageUrl: 'lib/assets/images/diaper 2.png',
    ),
    Product(
      id: '4',
      name: 'Molfix Pampers',
      description: 'Molfix brand pampers for babies.',
      price: 28.00,
      rating: 4.7,
      imageUrl: 'lib/assets/images/diaper 3.png',
    ),
    Product(
      id: '5',
      name: 'Huggies Comforts',
      description: 'Comfortable Huggies diapers.',
      price: 17.00,
      rating: 4.8,
      imageUrl: 'lib/assets/images/diaper 4.png',
    ),
    Product(
      id: '6',
      name: 'Little Campers',
      description: 'Diapers for little campers.',
      price: 12.00,
      rating: 4.6,
      imageUrl: 'lib/assets/images/diaper 5.png',
    ),
    Product(
      id: '7',
      name: 'Kiss Kids Diapers',
      description: 'Soft diapers for kids.',
      price: 22.00,
      rating: 4.5,
      imageUrl: 'lib/assets/images/diaper 6.png',
    ),
    Product(
      id: '8',
      name: 'Born Babies Diapers',
      description: 'Diapers for newborns.',
      price: 16.00,
      rating: 4.6,
      imageUrl: 'lib/assets/images/diaper baby.jpg',
    ),
    Product(
      id: '9',
      name: 'Bona Papa Diapers',
      description: 'Affordable diapers for babies.',
      price: 6.00,
      rating: 4.3,
      imageUrl: 'lib/assets/images/diaper.png',
    ),
    Product(
      id: '10',
      name: 'Bona Papa (Dry)',
      description: 'Dry version of Bona Papa diapers.',
      price: 4.00,
      rating: 4.2,
      imageUrl: 'lib/assets/images/diaperrrrr.png',
    ),
    Product(
      id: '11',
      name: 'Happy Kid Diapers',
      description: 'High-quality diapers for happy kids.',
      price: 240.00,
      rating: 4.9,
      imageUrl: 'lib/assets/images/child.jpg',
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
            'Child Diapers',
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
