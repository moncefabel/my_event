import 'package:flutter/material.dart';
import 'package:myevent/features/auth/services/auth_service.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  AuthService().logOut(context);
                },
                child: const Text("Log out"))
          ],
        )
      ],
    );
  }
}
