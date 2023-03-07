import 'package:app_web/Extensions/hover_extensions.dart';
import 'package:app_web/views/Etablissements/add_etb_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:app_web/Widgets/Call_To_Action/call_to_action_mobile.dart';
import 'package:app_web/Widgets/Call_To_Action/call_to_action_tablet_desktop.dart';
import 'package:app_web/routing/route_names.dart';

class CallToAction extends StatelessWidget {
  final String title;
  const CallToAction(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: CallToActionMobile(title, AddEtbScreen.routeName),
      tablet: CallToActionTabletDesktop(title, AddEtbScreen.routeName),
    ).showCursorOnHover.moveUpOnHover;
  }
}
