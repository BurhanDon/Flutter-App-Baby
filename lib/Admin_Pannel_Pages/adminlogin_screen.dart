import 'package:flutter/material.dart';
import 'package:test_delete/Admin_Pannel_Pages/adminpanel_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoggedIn = false;

  final String _linkedinUrl =
      'https://www.linkedin.com/in/burhan-siraj/'; // Moved to state class

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(_linkedinUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $_linkedinUrl';
    }
  }

  void _login() {
    String nameText = nameController.text.trim();
    String emailText = emailController.text.trim();
    String passwordText = passwordController.text.trim();

    if (nameText == "Burhan" &&
        emailText == "bu61796@gmail.com" &&
        passwordText == "admin123") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Admin_Pannel()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text('Name: Burhan, email: bu61796@gmail.com, pass: admin123.'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  Widget _buildInputBox(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFF4911A),
            backgroundImage: AssetImage('lib/assets/images/burhan3.png'),
          ),
          const SizedBox(height: 20),
          _buildInputBox('Name', nameController),
          _buildInputBox('Email', emailController),
          _buildInputBox('Password', passwordController, isPassword: true),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _login,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF4911A),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: const Text('Login',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF749F29),
        title: const Text(
          'Admin Login',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLoginForm(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: _launchURL,
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'This App is fully built by ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: 'Burhan Siraj',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        decoration:
                            TextDecoration.underline, // Underline only the name
                      ),
                      recognizer: TapGestureRecognizer()..onTap = _launchURL,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
