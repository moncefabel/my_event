import 'package:flutter/material.dart';

import '../../Widgets/Call_To_Action/call_to_action.dart';
import '../../Widgets/Course_Details/course_details.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        CourseDetails(),
        Expanded(child: Center(child: CallToAction('Join us now!')))
      ],
    );
  }
}
