import 'package:app_web/providers/proprio_provider.dart';
import 'package:app_web/views/Connection/SignIn/sign_in_screen.dart';
import 'package:app_web/views/Etablissements/etb_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/auth/services/auth_service.dart';
import '../../routing/router.dart';

class ConnectionView extends StatefulWidget {
  const ConnectionView({Key? key}) : super(key: key);

  @override
  State<ConnectionView> createState() => _ConnectionViewState();
}

class _ConnectionViewState extends State<ConnectionView> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getPrprioData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<ProprioProvider>(context).proprio.token.isNotEmpty
              ? const EtbScreen()
              : const SignInScreen()
    );
  }
}
