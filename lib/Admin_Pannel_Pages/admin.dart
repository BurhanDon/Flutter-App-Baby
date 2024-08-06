import 'package:flutter/material.dart';
import 'package:test_delete/Admin_Pannel_Pages/category_screen.dart';
import 'package:test_delete/Admin_Pannel_Pages/product_screen.dart';
import 'package:test_delete/pages/screens/widgets/login_screen.dart';

class Admin_Pannel extends StatefulWidget {
  static String routeName = "/Admin_Pannel";

  const Admin_Pannel({Key? key}) : super(key: key);

  @override
  _Admin_PannelState createState() => _Admin_PannelState();
}

class _Admin_PannelState extends State<Admin_Pannel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF749F29),
        title: const Text("Welcome Admin"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Admin_Pannel(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildAdminProfileCircle(),
            const SizedBox(height: 40),
            AdminMenu(
              text: "Dashboard",
              icon: Icons.dashboard,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Admin_Pannel(),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            AdminMenu(
              text: "Category",
              icon: Icons.category,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoryPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            AdminMenu(
              text: "Product",
              icon: Icons.shopping_cart,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            AdminMenu(
              text: "Orders",
              icon: Icons.list_alt,
              press: () {},
            ),
            const SizedBox(height: 30),
            AdminMenu(
              text: "Settings",
              icon: Icons.settings,
              press: () {},
            ),
            const SizedBox(height: 30),
            AdminMenu(
              text: "Log Out",
              icon: Icons.exit_to_app,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdminProfileCircle() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey.shade200,
          child: Icon(
            Icons.person,
            size: 60,
            color: Colors.grey.shade800,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: () {
              // Admin profile picture change logic
            },
            child: const Icon(
              Icons.camera_alt,
              color: Color(0xFF749F29),
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}

class AdminMenu extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback press;

  const AdminMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        onTap: press,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 25,
                color: const Color(0xFFF4911A),
              ),
              const SizedBox(width: 20), // Space between icon and text
              Text(
                text,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
