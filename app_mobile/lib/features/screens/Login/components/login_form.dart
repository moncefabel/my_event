import 'package:flutter/material.dart';
import 'package:app_mobile/features/auth/services/auth_service.dart';
import 'package:app_mobile/constants/utils.dart';
import 'package:app_mobile/components/already_have_an_account_acheck.dart';

import '../../Signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const LoginForm({
    super.key
  });

  @override
  State<LoginForm> createState() => _SignInFormState();
}
class _SignInFormState extends State<LoginForm>{
final AuthService authService = AuthService();
final _signInFormKey = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signInUser(){
    authService.signInUser(
      context: context, 
      email: _emailController.text,
      password: _passwordController.text, 
    );
  } 
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
             controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                if(_signInFormKey.currentState!.validate()){
                    signInUser();
                }
              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}