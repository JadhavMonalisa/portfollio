import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfollio/Utils/common_widgets.dart';
import 'package:portfollio/Utils/constants.dart';
import 'package:portfollio/Utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Responsive.isMobile(context)
            ? const Column(
                children: [
                  ProfileImage(
                    height: 200.0,
                    width: 150.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  IntroWidget(),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: DownloadCV(),
                  )
                ],
              )
            : const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IntroWidget(),
                  SizedBox(
                    width: 50.0,
                  ),
                  ProfileImage(),
                ],
              ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80.0,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Follow me : ",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SocialMediaIcon(
                  icon: 'assets/icons/linkedin.svg',
                  onTap: () => launchUrl(Uri.parse(
                      'https://www.linkedin.com/in/monali-jadhav-9a0a91a2'))),
              const SizedBox(
                width: 5.0,
              ),
              SocialMediaIcon(
                icon: 'assets/icons/github.svg',
                onTap: () =>
                    launchUrl(Uri.parse('https://github.com/JadhavMonalisa')),
              ),
              const SizedBox(
                width: 5.0,
              ),
              const SocialMediaIcon(icon: 'assets/icons/twitter.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
