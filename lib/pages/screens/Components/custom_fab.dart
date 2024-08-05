import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomFAB extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomFAB({Key? key, this.onPressed}) : super(key: key);

  Future<void> _launchLinkedIn() async {
    final Uri url = Uri.parse('https://www.linkedin.com/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 60.0, right: 10.0, left: 10.0, top: 0.0),
      child: Transform.rotate(
        angle: -0.5, // Adjust the rotation angle as needed
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFFF4911A),
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
            onPressed: onPressed ?? _launchLinkedIn,
            icon: Transform.rotate(
              angle: 0.5, // Adjust the rotation angle as needed
              child: const Icon(Icons.add_comment_sharp,
                  size: 30, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
