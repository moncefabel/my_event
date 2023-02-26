import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:testapp/Widgets/Call_To_Action/call_to_action_mobile.dart';
import 'package:testapp/Widgets/Call_To_Action/call_to_action_tablet_desktop.dart';
import 'package:testapp/routing/route_names.dart';

class CallToAction extends StatelessWidget {
  final String title;
  const CallToAction(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: CallToActionMobile(title, connectionRoute),
      tablet: CallToActionTabletDesktop(title, connectionRoute),
    );
  }
}
