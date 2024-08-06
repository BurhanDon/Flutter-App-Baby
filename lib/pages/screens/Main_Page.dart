import 'package:flutter/material.dart';
import 'package:test_delete/models/product.dart';
import 'package:test_delete/pages/baby_food_screen.dart';
import 'package:test_delete/pages/cloth_screen.dart';
import 'package:test_delete/pages/diapers_screen.dart';
import 'package:test_delete/pages/screens/Components/footer_widget.dart';
import 'package:test_delete/pages/screens/detail_screen.dart';
import 'package:test_delete/pages/screens/Components/bottomnavbar_widget.dart';
import 'package:test_delete/pages/screens/Components/CategoryCard.dart';
import 'package:test_delete/pages/screens/product_card.dart';
import 'package:test_delete/pages/toys_screen.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen>
    with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  bool _isBottomNavBarVisible = true;

  final List<Product> _bestSaleProducts = [
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
      imageUrl: 'lib/assets/images/toys.jpg',
    ),
    Product(
      id: '3',
      name: 'Toy Car',
      description: 'Exciting toy car for children.',
      price: 10.00,
      rating: 4.6,
      imageUrl: 'lib/assets/images/toys.jpg',
    ),
    Product(
      id: '4',
      name: 'Doll House',
      description: 'Beautiful doll house with furniture.',
      price: 35.00,
      rating: 4.8,
      imageUrl: 'lib/assets/images/toys.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'BabyShopHub',
                style: TextStyle(
                  color: Color(0xFF749F29),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFBFE08A), width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.search, color: Color(0xFF749F29)),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _isBottomNavBarVisible = !_isBottomNavBarVisible;
                  });
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF749F29),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(Icons.filter_list, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xfFE9EBEA),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/images/gif banner.gif'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 130,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CategoryCard(
                                icon: Icons.grid_view_outlined,
                                label: 'Categories',
                                onTap: () {},
                                iconColor: Colors.white,
                                backgroundColor: const Color(0xFF749F29),
                              ),
                              CategoryCard(
                                icon: Icons.toys,
                                label: 'Toys',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ToysPage(),
                                    ),
                                  );
                                },
                              ),
                              CategoryCard(
                                icon: Icons.bedroom_baby_outlined,
                                label: 'Diapers',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DiaperPage(),
                                    ),
                                  );
                                },
                              ),
                              CategoryCard(
                                icon: Icons.sledding_sharp,
                                label: 'Cloths',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ClothPage(),
                                    ),
                                  );
                                },
                              ),
                              CategoryCard(
                                icon: Icons.food_bank_outlined,
                                label: 'Baby Foods',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const BabyfoodPage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 18.0, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Sale Products',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF749F29),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 13, right: 13, bottom: 20),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.9, // Adjust as needed
                  ),
                  itemCount: _bestSaleProducts.length,
                  itemBuilder: (context, index) {
                    final product = _bestSaleProducts[index];
                    return ProductCard(
                      product: product,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(product: product),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          const FooterWidget(),
        ],
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _isBottomNavBarVisible ? 60 : 0,
        child: _isBottomNavBarVisible
            ? const BottomNavBar(
                currentIndex: 0,
              )
            : null,
      ),
    );
  }
}
