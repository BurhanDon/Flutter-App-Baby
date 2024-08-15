import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: const Color.fromARGB(92, 255, 255, 255),
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
              FooterLink(
                  text: 'PPH',
                  url:
                      'https://www.peopleperhour.com/freelancer/technology-programming/burhan-siraj-full-stack-developer-wordpress-zajmnaaa'),
              FooterLink(
                  text: 'Hire talent',
                  url:
                      'https://www.upwork.com/freelancers/~01cd954bf9c9f3d7c9'),
              FooterLink(
                  text: 'Portfolio',
                  url: 'http://burhans-portfolio.netlify.app/'),
              FooterLink(
                  text: 'Instagram',
                  url: 'https://www.instagram.com/rich_burhann/'),
              FooterLink(
                  text: 'Facebook',
                  url:
                      'https://www.facebook.com/profile.php?id=100054100966996'),
              FooterLink(
                  text: 'LinkedIn',
                  url: 'https://www.linkedin.com/in/burhan-siraj/'),
            ],
          ),
          const SizedBox(height: 10),
          // Social media icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.facebook, color: Colors.blue),
                onPressed: () async {
                  await _launchUrl(
                      'https://www.facebook.com/profile.php?id=100054100966996');
                },
              ),
              IconButton(
                icon: const Icon(Icons.add_ic_call, color: Colors.lightBlue),
                onPressed: () async {
                  await _launchUrl(
                      'https://wa.me/+923182677471?text=Hi%20Burhan%20how%20are%20you%3F');
                },
              ),
              IconButton(
                icon: const Icon(Icons.add_location_alt_rounded,
                    color: Colors.purple),
                onPressed: () async {
                  await _launchUrl('https://maps.google.com');
                },
              ),
              IconButton(
                icon:
                    const Icon(Icons.perm_identity_rounded, color: Colors.red),
                onPressed: () async {
                  await _launchUrl('https://github.com/BurhanDon/');
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Bottom links
          const Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            children: [
              FooterBottomLink(
                  text: '© 2024 Baby Shop Hub', url: 'https://example.com'),
              FooterBottomLink(text: 'Terms', url: 'https://example.com/terms'),
              FooterBottomLink(
                  text: 'Privacy', url: 'https://example.com/privacy'),
              FooterBottomLink(
                  text: 'Cookies', url: 'https://example.com/cookies'),
              FooterBottomLink(text: 'Jobs', url: 'https://example.com/jobs'),
              FooterBottomLink(
                  text: 'Designers', url: 'https://example.com/designers'),
              FooterBottomLink(
                  text: 'Freelancers', url: 'https://example.com/freelancers'),
              FooterBottomLink(text: 'Tags', url: 'https://example.com/tags'),
              FooterBottomLink(
                  text: 'Places', url: 'https://example.com/places'),
              FooterBottomLink(
                  text: 'Resources', url: 'https://example.com/resources'),
            ],
          ),
        ],
      ),
    );
  }
}

class FooterLink extends StatelessWidget {
  final String text;
  final String url;

  const FooterLink({required this.text, required this.url, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await _launchUrl(url);
      },
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
  final String url;

  const FooterBottomLink({required this.text, required this.url, Key? key})
      : super(key: key);

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
        recognizer: TapGestureRecognizer()
          ..onTap = () async {
            await _launchUrl(url);
          },
      ),
    );
  }
}

Future<void> _launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
