import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Heading
          const Text(
            'Baby Shop Hub',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          // Top links
          const Wrap(
            alignment: WrapAlignment.center,
            spacing: 15,
            children: [
              FooterLink(text: 'For designers'),
              FooterLink(text: 'Hire talent'),
              FooterLink(text: 'Inspiration'),
              FooterLink(text: 'Advertising'),
              FooterLink(text: 'Blog'),
              FooterLink(text: 'About'),
              FooterLink(text: 'Careers'),
              FooterLink(text: 'Support'),
            ],
          ),
          const SizedBox(height: 10),
          // Social media icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.facebook, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.facebook, color: Colors.lightBlue),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.facebook, color: Colors.purple),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.facebook, color: Colors.red),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Bottom links
          const Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            children: [
              FooterBottomLink(text: '© 2024 Baby Shop Hub'),
              FooterBottomLink(text: 'Terms'),
              FooterBottomLink(text: 'Privacy'),
              FooterBottomLink(text: 'Cookies'),
              FooterBottomLink(text: 'Jobs'),
              FooterBottomLink(text: 'Designers'),
              FooterBottomLink(text: 'Freelancers'),
              FooterBottomLink(text: 'Tags'),
              FooterBottomLink(text: 'Places'),
              FooterBottomLink(text: 'Resources'),
            ],
          ),
        ],
      ),
    );
  }
}

class FooterLink extends StatelessWidget {
  final String text;

  const FooterLink({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black87,
          decoration: TextDecoration.none,
          fontSize: 14,
        ),
      ),
    );
  }
}

class FooterBottomLink extends StatelessWidget {
  final String text;

  const FooterBottomLink({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
          decoration: TextDecoration.none,
        ),
        recognizer: TapGestureRecognizer()..onTap = () {},
      ),
    );
  }
}
