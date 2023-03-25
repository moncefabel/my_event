import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../features/auth/services/auth_service.dart';
import '../../providers/proprio_provider.dart';
import '../Connection/SignIn/sign_in_screen.dart';

class Params extends StatefulWidget {
  const Params({super.key});

  @override
  State<Params> createState() => _ParamsState();
}

class _ParamsState extends State<Params> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<ProprioProvider>(context).proprio.token.isEmpty
    ? const SignInScreen()
    : Row(
          children: [
            ElevatedButton(
              onPressed: () {
                AuthService().logOut(context);
              },
              child: const Text("Log out"))
          ],
        );
  }
}