import 'package:flutter/material.dart';
import 'package:testapp/Widgets/Call_To_Action/call_to_action.dart';
import 'package:testapp/Widgets/Course_Details/course_details.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        CourseDetails(),
        SizedBox(
          height: 100,
        ),
        CallToAction('Join us now!'),
      ],
    );
  }
}
