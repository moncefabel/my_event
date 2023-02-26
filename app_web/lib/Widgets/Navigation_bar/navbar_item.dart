import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:app_web/Services/navigation_service.dart';
import 'package:app_web/locator.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  const NavBarItem(this.title, this.navigationPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, sizingInformation) => GestureDetector(
              onTap: () {
                //should not use service directily in ui to change state
                //better use from a view model
                locator<NavigationService>().navigateTo(navigationPath);
                if (sizingInformation.isMobile) {
                  Navigator.pop(context);
                }
              },
              child: Text(
                title,
                style: const TextStyle(fontSize: 18),
              ),
            ));
  }
}
