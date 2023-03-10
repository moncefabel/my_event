
import 'package:flutter/material.dart';
import 'package:myevent/features/screens/Params/log_out_button.dart';
import 'package:provider/provider.dart';

import '../../../provider/customer_provider.dart';
import '../../../router.dart';
import '../../auth/services/auth_service.dart';
import 'components/login_screen.dart';



class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getCustomerData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<CustomerProvider>(context).customer.token.isNotEmpty
              ? const LogOutButton()
              : const LoginScreen()
    );
  }
}
