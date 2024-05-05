import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfollio/Utils/common_widgets.dart';
import 'package:portfollio/Utils/constants.dart';
import 'package:portfollio/view/common/drawer.dart';
import 'package:portfollio/view/experience/experience.dart';
import 'package:portfollio/view/home/home.dart';
import 'package:portfollio/view/projects/projects.dart';
import 'package:portfollio/view/skills/skills.dart';
import 'package:portfollio/view_model/controller.dart';
import 'package:portfollio/view_model/responsive.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          kIsWeb && !Responsive.isLargeMobile(context)
              ? const SizedBox(
                  height: defaultPadding * 2,
                )
              : const SizedBox(
                  height: 10.0,
                ),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.05,
            ),
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 200),
              builder: (context, value, child) {
                return InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: defaultPadding * 2.0 * value,
                    width: defaultPadding * 2.0 * value,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.pinkAccent.withOpacity(.5),
                              offset: const Offset(1, 1)),
                          BoxShadow(
                              color: Colors.blue.withOpacity(.5),
                              offset: const Offset(-1, -1)),
                        ]),
                    child: Center(
                        child: ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                                colors: [Colors.pink, Colors.blue.shade900])
                            .createShader(bounds);
                      },
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: defaultPadding * 1.2 * value,
                      ),
                    )),
                  ),
                );
              },
            ),
            const Spacer(),
            if (!Responsive.isMobile(context)) const NavigationButtons(),
            if (!Responsive.isMobile(context)) const Spacer(),
            const ConnectButton(),
            const SizedBox(
              width: 20.0,
            )
          ]),
          if (Responsive.isMobile(context))
            const Center(child: NavigationButtons()),
          Expanded(
            flex: 9,
            child: PageView(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: const [
                HomeView(),
                Skills(),
                Projects(),
                ExperienceView()
              ],
            ),
          )
        ],
      ),
    );
  }
}
