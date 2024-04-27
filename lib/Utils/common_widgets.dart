import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfollio/Utils/constants.dart';
import 'package:portfollio/view_model/controller.dart';
import 'package:portfollio/view_model/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/svg.dart';

class NavigationTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const NavigationTextButton(
      {super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }
}

class NavigationButtons extends StatelessWidget {
  const NavigationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NavigationTextButton(
                  onTap: () {
                    controller.animateToPage(0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  text: 'Home'),
              NavigationTextButton(
                  onTap: () {
                    controller.animateToPage(1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  text: 'Skills'),
              NavigationTextButton(
                  onTap: () {
                    controller.animateToPage(2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  text: 'Projects'),
              NavigationTextButton(
                  onTap: () {
                    controller.animateToPage(3,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  text: 'Experience'),
            ],
          ),
        );
      },
    );
  }
}

class ConnectButton extends StatelessWidget {
  const ConnectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: InkWell(
        onTap: () {
          launchUrl(Uri.parse('https://wa.me/8390235798'));
        },
        borderRadius: BorderRadius.circular(defaultPadding + 10),
        child: Container(
            height: 40,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultPadding),
                gradient: LinearGradient(colors: [
                  Colors.pink,
                  Colors.blue.shade900,
                ]),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.blue,
                      offset: Offset(0, -1),
                      blurRadius: defaultPadding / 4),
                  BoxShadow(
                      color: Colors.red,
                      offset: Offset(0, 1),
                      blurRadius: defaultPadding / 4),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.greenAccent,
                  size: 15,
                ),
                const SizedBox(width: defaultPadding / 4),
                Text(
                  'Whatsapp',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Colors.white,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
      ),
    );
  }
}

class MyPortfolioText extends StatelessWidget {
  const MyPortfolioText({super.key, required this.start, required this.end});

  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return TweenAnimationBuilder(
        tween: Tween(begin: start, end: end),
        duration: const Duration(milliseconds: 200),
        builder: (context, value, child) {
          return Text('Monali Jadhav',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  height: 0,
                  fontSize: value));
        },
      );
    });
  }
}

class AnimatedSubtitleText extends StatelessWidget {
  final double start;
  final double end;
  final String text;
  final bool gradient;

  const AnimatedSubtitleText({
    super.key,
    required this.start,
    required this.end,
    required this.text,
    this.gradient = false,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Text(
          text,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              shadows: gradient
                  ? [
                      const Shadow(
                          color: Colors.pink,
                          offset: Offset(0, 2),
                          blurRadius: 10),
                      const Shadow(
                          color: Colors.pink,
                          offset: Offset(0, -2),
                          blurRadius: 10),
                    ]
                  : [],
              height: 0,
              fontSize: value),
        );
      },
    );
  }
}

class ProfileImage extends StatefulWidget {
  const ProfileImage({Key? key, this.height = 300, this.width = 250})
      : super(key: key);
  final double? width;
  final double? height;

  @override
  ProfileImageState createState() => ProfileImageState();
}

class ProfileImageState extends State<ProfileImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true); // Repeat the animation loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;
        return Transform.translate(
          offset: Offset(0, 2 * value), // Move the container up and down
          child: Container(
            height: widget.height!,
            width: widget.width!,
            padding: const EdgeInsets.all(defaultPadding / 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(colors: [
                Colors.pinkAccent,
                Colors.blue,
              ]),
              boxShadow: const [
                BoxShadow(
                  color: Colors.pink,
                  offset: Offset(-2, 0),
                  blurRadius: 20,
                ),
                BoxShadow(
                  color: Colors.blue,
                  offset: Offset(2, 0),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.asset(
                'assets/images/image.png',
                height: Responsive.isLargeMobile(context)
                    ? MediaQuery.sizeOf(context).width * 0.2
                    : Responsive.isTablet(context)
                        ? MediaQuery.sizeOf(context).width * 0.14
                        : 200,
                width: Responsive.isLargeMobile(context)
                    ? MediaQuery.sizeOf(context).width * 0.2
                    : Responsive.isTablet(context)
                        ? MediaQuery.sizeOf(context).width * 0.14
                        : 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: Responsive.isMobile(context)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Responsive(
            desktop: MyPortfolioText(start: 40, end: 50),
            largeMobile: MyPortfolioText(start: 40, end: 35),
            mobile: MyPortfolioText(start: 35, end: 30),
            tablet: MyPortfolioText(start: 50, end: 40)),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: Responsive.isMobile(context)
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            const Responsive(
              desktop:
                  AnimatedSubtitleText(start: 30, end: 40, text: 'Flutter '),
              largeMobile:
                  AnimatedSubtitleText(start: 30, end: 25, text: 'Flutter '),
              mobile:
                  AnimatedSubtitleText(start: 25, end: 20, text: 'Flutter '),
              tablet:
                  AnimatedSubtitleText(start: 40, end: 30, text: 'Flutter '),
            ),
            (kIsWeb && Responsive.isLargeMobile(context)
                ? const Responsive(
                    desktop: AnimatedSubtitleText(
                        start: 30, end: 40, text: 'Developer ', gradient: true),
                    largeMobile: AnimatedSubtitleText(
                        start: 30, end: 25, text: 'Developer ', gradient: true),
                    mobile: AnimatedSubtitleText(
                        start: 25, end: 20, text: 'Developer ', gradient: true),
                    tablet: AnimatedSubtitleText(
                        start: 40, end: 30, text: 'Developer ', gradient: true),
                  )
                : ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(colors: [
                        Colors.pink,
                        Colors.blue,
                      ]).createShader(bounds);
                    },
                    child: const Responsive(
                      desktop: AnimatedSubtitleText(
                          start: 30,
                          end: 40,
                          text: 'Developer ',
                          gradient: false),
                      largeMobile: AnimatedSubtitleText(
                          start: 30,
                          end: 25,
                          text: 'Developer ',
                          gradient: false),
                      mobile: AnimatedSubtitleText(
                          start: 25,
                          end: 20,
                          text: 'Developer ',
                          gradient: true),
                      tablet: AnimatedSubtitleText(
                          start: 40,
                          end: 30,
                          text: 'Developer ',
                          gradient: false),
                    ),
                  ))
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: Responsive.isMobile(context)
              ? const EdgeInsets.only(left: 20.0, right: 20.0)
              : EdgeInsets.zero,
          child: const Responsive(
            desktop: AnimatedDescriptionText(start: 14, end: 15),
            largeMobile: AnimatedDescriptionText(start: 14, end: 12),
            mobile: AnimatedDescriptionText(start: 14, end: 12),
            tablet: AnimatedDescriptionText(start: 17, end: 14),
          ),
        ),
        if (!Responsive.isMobile(context))
          const Padding(
              padding: EdgeInsets.only(top: 20.0), child: DownloadCV()),
      ],
    );
  }
}

class AnimatedDescriptionText extends StatelessWidget {
  const AnimatedDescriptionText(
      {super.key, required this.start, required this.end});

  final double start;
  final double end;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: start, end: end),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Text(
          'My expertise lies in crafting mobile apps, ${Responsive.isLargeMobile(context) ? '\n' : ''}every step from ${!Responsive.isLargeMobile(context) ? '\n' : ''}overseeing the entire journey from concept to deployment.',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey, wordSpacing: 2, fontSize: value),
        );
      },
    );
  }
}

class DownloadCV extends StatelessWidget {
  const DownloadCV({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse(
            'https://drive.google.com/file/d/1f67rxSLqv7NkB2m4fW5_Ep--MBqqH3TW/view?usp=drive_link'));
      },
      child: Container(
        width: 200.0,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
            vertical: defaultPadding / 1.5, horizontal: defaultPadding * 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.blue, offset: Offset(0, -1), blurRadius: 5),
            BoxShadow(color: Colors.red, offset: Offset(0, 1), blurRadius: 5),
          ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.pink,
                Colors.blue.shade900,
              ]),
        ),
        child: Row(
          children: [
            Text(
              'Download CV',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Colors.white,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: defaultPadding / 3,
            ),
            const Icon(
              FontAwesomeIcons.download,
              color: Colors.white70,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({super.key, required this.icon, this.onTap});

  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding * 0.4),
        child: SvgPicture.asset(
          icon,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          height: 15,
          width: 15,
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.prefix, required this.title});

  final String prefix;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$prefix ',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Colors.white,
              fontSize: !Responsive.isDesktop(context)
                  ? Responsive.isLargeMobile(context)
                      ? 20
                      : 30
                  : 50,
              fontWeight: FontWeight.bold),
        ),
        kIsWeb && Responsive.isDesktop(context)
            ? ShaderMask(
                shaderCallback: (bounds) {
                  return const LinearGradient(
                      end: Alignment.centerRight,
                      begin: Alignment.centerLeft,
                      colors: [
                        Colors.pink,
                        Colors.cyanAccent,
                      ]).createShader(bounds);
                },
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontSize: !Responsive.isDesktop(context)
                          ? Responsive.isLargeMobile(context)
                              ? 20
                              : 30
                          : 50,
                      fontWeight: FontWeight.bold),
                ),
              )
            : Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                    fontSize: !Responsive.isDesktop(context)
                        ? Responsive.isLargeMobile(context)
                            ? 20
                            : 30
                        : 50,
                    fontWeight: FontWeight.bold),
              ),
      ],
    );
  }
}
