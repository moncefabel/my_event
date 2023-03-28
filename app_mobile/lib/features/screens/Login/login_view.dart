
import 'package:flutter/material.dart';
import 'package:myevent/features/screens/Historic/historic_buy_page.dart';
import 'package:myevent/features/screens/Params/log_out_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../provider/customer_provider.dart';
import '../../../router.dart';
import '../../auth/services/auth_service.dart';
import '../Home/home.dart';
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
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<CustomerProvider>(context).customer.token.isNotEmpty
              ? const MylogoutPage()
              : const LoginScreen()
    );
  }
}
