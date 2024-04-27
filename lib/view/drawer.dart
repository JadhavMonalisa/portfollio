import 'package:flutter/material.dart';
import 'package:portfollio/Utils/colors.dart';
import 'package:portfollio/Utils/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.23,
              child: Container(
                color: bgColor,
                child: Column(
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      padding: const EdgeInsets.all(defaultPadding / 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                            colors: [
                              Colors.pink,
                              Colors.blue.shade900,
                            ],
                          ),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.pink,
                                blurRadius: 10,
                                offset: Offset(0, 2)),
                            BoxShadow(
                                color: Colors.blue,
                                blurRadius: 10,
                                offset: Offset(0, -2)),
                          ]),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Transform.rotate(
                              angle: 0.1,
                              child: Image.asset(
                                'assets/images/profileImage.jpg',
                                fit: BoxFit.cover,
                              ))),
                    ),
                    const Spacer(),
                    const Text(
                      'Monali Jadhav',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: defaultPadding / 4,
                    ),
                    const Text(
                      'Mobile Application Developer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          height: 1.5,
                          color: Colors.white),
                    ),
                    const Text(
                      '[Android, Flutter - Mobile, Web]',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          height: 1.5,
                          color: Colors.amberAccent),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            const ContactText(title: 'Contact', text: '8390235798'),
            const ContactText(title: 'Email', text: 'monalisaj813@gmail.com'),
            const ContactText(
                title: 'LinkedIn',
                text: 'https://www.linkedin.com/in/monali-jadhav-9a0a91a2/'),
            const ContactText(title: 'Github', text: 'JadhavMonalisa'),
            const SizedBox(
              height: defaultPadding,
            ),
          ],
        ),
      ),
    );
  }
}

class ContactText extends StatelessWidget {
  const ContactText({super.key, required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2, left: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white38),
          ),
          const Divider(
            color: Colors.purple,
          )
        ],
      ),
    );
  }
}
