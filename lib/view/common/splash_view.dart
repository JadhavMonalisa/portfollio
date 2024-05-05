import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfollio/Utils/colors.dart';
import 'package:portfollio/Utils/constants.dart';
import 'package:portfollio/Utils/responsive.dart';
import 'package:portfollio/view/common/main_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainView(),
          ));
    });
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
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final value = _controller.value;
                return Transform.translate(
                  offset: Offset(0, 2 * value),
                  // Move the container up and down
                  child: Container(
                    height: 100.0,
                    width: 100.0,
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
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            SizedBox(
              width: defaultPadding * 5,
              child: TweenAnimationBuilder(
                duration: const Duration(seconds: 2),
                builder: (context, value, child) => Column(
                  children: [
                    LinearProgressIndicator(
                      backgroundColor: Colors.black,
                      color: Colors.deepPurpleAccent,
                      value: value,
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Text(
                      '${(value * 100).toInt()}%',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: Colors.pink,
                                blurRadius: 10,
                                offset: Offset(2, 2)),
                            Shadow(
                                color: Colors.blue,
                                blurRadius: 10,
                                offset: Offset(-2, -2)),
                          ]),
                    )
                  ],
                ),
                tween: Tween(begin: 0.0, end: 1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
