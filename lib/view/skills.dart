import 'package:flutter/material.dart';
import 'package:portfollio/Utils/constants.dart';
import 'package:portfollio/Utils/responsive.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.isMobile(context)
          ? const EdgeInsets.only(left: 10.0, right: 10.0)
          : const EdgeInsets.only(left: 300.0, right: 300.0),
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: Colors.purple),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedLinearProgressIndicator(
              percentage: 0.7,
              title: 'Flutter',
              image: 'assets/icons/flutter.png',
            ),
            AnimatedLinearProgressIndicator(
                percentage: 0.9, title: 'Dart', image: 'assets/icons/dart.png'),
            AnimatedLinearProgressIndicator(
                percentage: 0.6,
                title: 'Firebase',
                image: 'assets/icons/firebase.png'),
            AnimatedLinearProgressIndicator(
                percentage: 0.6,
                title: 'Sqlite',
                image: 'assets/icons/dart.png'),
            AnimatedLinearProgressIndicator(
                percentage: 0.8,
                title: 'Responsive Design',
                image: 'assets/icons/flutter.png'),
            AnimatedLinearProgressIndicator(
                percentage: 0.9,
                title: 'Clean Architecture',
                image: 'assets/icons/flutter.png'),
            AnimatedLinearProgressIndicator(
                percentage: 0.5,
                title: 'Provider',
                image: 'assets/icons/dart.png'),
            AnimatedLinearProgressIndicator(
                percentage: 0.55,
                title: 'Getx',
                image: 'assets/icons/dart.png'),
          ],
        ),
      ),
    );
  }
}

class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator(
      {super.key, required this.percentage, required this.title, this.image});

  final double percentage;
  final String title;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: percentage),
        duration: const Duration(seconds: 1),
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      image!,
                      height: 15,
                      width: 15,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      title,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Spacer(),
                    Text('${(value * 100).toInt().toString()}%',
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
                LinearProgressIndicator(
                  value: value,
                  backgroundColor: Colors.black,
                  color: Colors.amberAccent,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
