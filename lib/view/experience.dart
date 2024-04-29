import 'package:flutter/material.dart';
import 'package:portfollio/Utils/common_widgets.dart';
import 'package:portfollio/Utils/constants.dart';
import 'package:portfollio/Utils/responsive.dart';
import 'package:portfollio/view/experience_grid.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Responsive.isLargeMobile(context))
            const SizedBox(
              height: defaultPadding,
            ),
          const TitleText(prefix: 'Industry', title: 'Experience'),
          const SizedBox(
            height: defaultPadding,
          ),
          Expanded(
              child: Responsive(
                  desktop: ExperienceGrid(
                    crossAxisCount: 3,
                    ratio: 1.5,
                  ),
                  extraLargeScreen:
                      ExperienceGrid(crossAxisCount: 3, ratio: 1.6),
                  largeMobile: ExperienceGrid(crossAxisCount: 1, ratio: 1.8),
                  mobile: ExperienceGrid(crossAxisCount: 1, ratio: 1.0),
                  tablet: ExperienceGrid(
                    ratio: 1.7,
                    crossAxisCount: 2,
                  )))
        ],
      ),
    );
  }
}
