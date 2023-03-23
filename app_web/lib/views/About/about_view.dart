import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/proprio_provider.dart';
import '../Connection/SignIn/sign_in_screen.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider.of<ProprioProvider>(context).proprio.token.isNotEmpty
            ? const Text("Reservations")
            : const SignInScreen();
  }
}
