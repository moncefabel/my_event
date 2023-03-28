import 'package:app_web/features/proprio/services/proprio_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../features/auth/services/auth_service.dart';
import '../../providers/proprio_provider.dart';
import '../Connection/SignIn/sign_in_screen.dart';

class Params extends StatefulWidget {
  const Params({super.key});

  @override
  State<Params> createState() => _ParamsState();
}

class _ParamsState extends State<Params> {
  final ProprioService proprioService = ProprioService();
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
  }

  void updateProprio() {
    proprioService.updateProprio(
      context: context,
      email: _emailController.text,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      phoneNumber: _phoneNumberController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<ProprioProvider>(context, listen: false);
    _emailController.text = userProvider.proprio.email;
    _lastNameController.text = userProvider.proprio.lastName;
    _firstNameController.text = userProvider.proprio.firstName;
    _phoneNumberController.text = userProvider.proprio.phoneNumber;
    return Provider.of<ProprioProvider>(context).proprio.token.isEmpty
        ? const SignInScreen()
        : Center(
            child: Form(
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
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Enter your your email';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
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
                        if (val == null || val.isEmpty) {
                          return 'Enter your first name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
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
                        if (val == null || val.isEmpty) {
                          return 'Enter your last name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
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
                        if (val == null || val.isEmpty) {
                          return 'Enter your phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  ElevatedButton(
                    onPressed: () {
                      if (_signUpFormKey.currentState!.validate()) {
                        updateProprio();
                      }
                    },
                    child: Text("Save".toUpperCase()),
                  ),
                  const SizedBox(height: defaultPadding),
                  ElevatedButton(
                      onPressed: () {
                        AuthService().logOut(context);
                      },
                      child: const Text("Log out"))
                ],
              ),
            ),
          );
  }
}
