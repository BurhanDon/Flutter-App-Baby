import 'package:flutter/material.dart';
import 'package:test_delete/pages/screens/Main_Page.dart';
import 'package:test_delete/pages/screens/widgets/registration_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 50000), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const RegistrationScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            color: Colors.white,
          ),
          ClipPath(
            clipper: NativeClipper(),
            child: Container(
              height: 450,
              color: const Color(0xFFF4911A),
            ),
          ),
          Positioned(
            bottom: 405.0, // Adjust this value as per your requirement
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.8,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/round image.png'),
                ),
              ),
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 400.0),
              child: Text(
                'Your One-Stop Destination \n       for Baby Essentials \n          BabyShopHub',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 140,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 600.0),
              child: Container(
                width: 350,
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
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
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 25.0,
            bottom: 35.0,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPageScreen(),
                  ),
                );
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                    color: Color(0xFF749F29),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NativeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
