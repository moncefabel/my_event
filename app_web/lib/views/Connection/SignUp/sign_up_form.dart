import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../features/auth/services/auth_service.dart';

class SignUpForm extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final AuthService authService = AuthService();
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
  }

  void signUpProprio() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      phoneNumber: _phoneNumberController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signUpFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: primaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
            validator: (value){
              if(value!.isEmpty || !RegExp(r'^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$').hasMatch(value)){
                return "Enter correct Email";
              }else{
                return null;
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: primaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
              validator: (val) {
                if (!RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{6,}$').hasMatch(val!) || val.isEmpty) {
                  return 'Password: at least 1 uppercase, 1 lowercase, 1 number, 6 characters';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _firstNameController,
              textInputAction: TextInputAction.done,
              cursorColor: primaryColor,
              decoration: const InputDecoration(
                hintText: "First Name",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
              ),
              validator: (val) {
                if (!RegExp(r'^[a-zA-Z]{2,}$').hasMatch(val!) || val.isEmpty) {
                  return 'Enter your first name';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _lastNameController,
              textInputAction: TextInputAction.done,
              cursorColor: primaryColor,
              decoration: const InputDecoration(
                hintText: "Last Name",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
              ),
              validator: (val) {
                if (!RegExp(r'^[a-zA-Z]{2,}$').hasMatch(val!) || val.isEmpty) {
                  return 'Enter your last name';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _phoneNumberController,
              textInputAction: TextInputAction.done,
              cursorColor: primaryColor,
              decoration: const InputDecoration(
                hintText: "Phone number",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                ),
              ),
              validator: (val) {
                if (!RegExp(r'^[+]?[(]?[0-9]{1,4}[)]?[-\s\.]?[0-9]{3,4}[-\s\.]?[0-9]{3,4}$').hasMatch(val!) || val.isEmpty) {
                  return 'Enter a valid phone number';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              if(_signUpFormKey.currentState!.validate()){
                signUpProprio();
              }
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
