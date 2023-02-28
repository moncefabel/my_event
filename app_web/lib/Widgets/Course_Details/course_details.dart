import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var textAlignment =
          sizingInformation.isDesktop ? TextAlign.left : TextAlign.center;

      double titleSize = sizingInformation.isMobile ? 50 : 80;

      double descriptionSize = sizingInformation.isMobile ? 16 : 21;

      return SizedBox(
          width: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'MyEvent\nFor our owners',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      height: 0.9,
                      fontSize: titleSize),
                  textAlign: textAlignment,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Joins us today and become a members of a future growing community.',
                  style: TextStyle(fontSize: descriptionSize, height: 1.7),
                  textAlign: textAlignment,
                ),
              ],
            ));
    });
  }
}
