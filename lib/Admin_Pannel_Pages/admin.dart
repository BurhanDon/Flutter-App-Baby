import 'package:flutter/material.dart';
import 'package:test_delete/Admin_Pannel_Pages/category_screen.dart';
import 'package:test_delete/Admin_Pannel_Pages/order_screen.dart';
import 'package:test_delete/Admin_Pannel_Pages/product_screen.dart';
import 'package:test_delete/Admin_Pannel_Pages/setting_screen.dart';

class Admin_Pannel extends StatefulWidget {
  const Admin_Pannel({super.key});

  @override
  State<Admin_Pannel> createState() => _Admin_PannelState();
}

class _Admin_PannelState extends State<Admin_Pannel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: const Color(0xFF749F29),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Row(
                    children: [
                      _buildSliderText('Dashboard', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Admin_Pannel()));
                      }),
                      _buildSliderText('Category', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CategoryPage()));
                      }),
                      _buildSliderText('Product', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProductPage()));
                      }),
                      _buildSliderText('Order', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OrderPage()));
                      }),
                      _buildSliderText('Settings', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingPage()));
                      }),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDashboardItem('Category', const CategoryPage()),
                    _buildDashboardItem('Product', const ProductPage()),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDashboardItem('Orders', const OrderPage()),
                    _buildDashboardItem('Setting', const SettingPage()),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDashboardItem('Active Users', null),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderText(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        margin: const EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardItem(String title, Widget? page) {
    return InkWell(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 150,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '2',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
