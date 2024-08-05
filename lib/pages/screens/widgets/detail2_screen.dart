import 'package:flutter/material.dart';
import 'package:test_delete/pages/screens/widgets/shopping_cart_2_screen.dart';
import 'package:test_delete/pages/screens/widgets/splash_screen.dart';
import '../Main_Page.dart';

class DetailPage2 extends StatefulWidget {
  const DetailPage2({super.key});

  @override
  State<DetailPage2> createState() => _DetailPage2State();
}

class _DetailPage2State extends State<DetailPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF749F29),
        elevation: 0,
        title: const Center(
          child: Text(
            'Details',
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
                Icon(Icons.shopping_basket_outlined),
              ],
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ClipPath background
          Stack(
            children: [
              ClipPath(
                clipper: NativeClipper(),
                child: Container(
                  height: 350,
                  color: const Color(0xFF749F29), // Choose the color you want
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Positioned(
                    child: Image(
                      height: 500,
                      width: 500,
                      image: AssetImage('lib/assets/images/clothiiii.png'),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 420.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      'Child Cloths',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Color(0xFFF4911A)),
                        Text('4.55',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: EdgeInsets.only(top: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\20.00',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFFF4911A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Discover the perfect blend of style, comfort, and durability with our exquisite collection of childrens clothing. Carefully curated to meet the needs of active and playful youngsters, our range features a delightful array of designs, colors, and patterns',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Container(
              width: 350,
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShoppingCart2(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF749F29),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
        height: 80,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.shop,
                    color: Color(0xFF749F29),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text('Home'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.search),
                  SizedBox(
                    height: 3,
                  ),
                  Text('Search'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.shopping_cart),
                  SizedBox(
                    height: 3,
                  ),
                  Text('Cart'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.history),
                  SizedBox(
                    height: 3,
                  ),
                  Text('Orders'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.star),
                  SizedBox(
                    height: 3,
                  ),
                  Text('Reviews'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    height: 3,
                  ),
                  Text('Profile'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
