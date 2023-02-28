import 'package:app_web/common/widgets/custom_button.dart';
import 'package:app_web/common/widgets/custom_textfield.dart';
import 'package:app_web/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';



enum Auth{
  signin,
  signup
}
class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
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

  void signUpProprio(){
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        children: [
          const Text(
            'Welcome',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),
          ),
          ListTile(
            title: const Text("Créer un compte",
            style: TextStyle(
              fontWeight: FontWeight.bold
            )
            ),
            leading: Radio(
              activeColor: Colors.blue[200],
              value: Auth.signup,
              groupValue: _auth,
              onChanged: (Auth? val ) {
                setState(() {
                  _auth = val!;
                });
              },
            ),
          ),
          if(_auth == Auth.signup)
            Form(
              key:_signUpFormKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 10,),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                  ),
                  const SizedBox(height: 10,),
                  CustomTextField(
                    controller: _firstNameController,
                    hintText: 'First Name',
                  ),
                  const SizedBox(height: 10,),
                  CustomTextField(
                    controller: _lastNameController,
                    hintText: 'Last Name',
                  ),
                  const SizedBox(height: 10,),
                  CustomTextField(
                    controller: _phoneNumberController,
                    hintText: 'Phone Number',
                  ),
                  const SizedBox(height: 10,),
                  CustomButton(
                    text: 'Sign up', 
                    onTap: () {
                      if(_signUpFormKey.currentState!.validate()){
                        signUpProprio();
                      }
                    }
                  )
                ],
              ),
            ),
          ListTile(
            title: const Text("Connexion",
            style: TextStyle(
              fontWeight: FontWeight.bold
            )
            ),
            leading: Radio(
              activeColor: Colors.blue[200],
              value: Auth.signin,
              groupValue: _auth,
              onChanged: (Auth? val ) {
                setState(() {
                  _auth = val!;
                });
              },
            ),
          ),
          if(_auth == Auth.signin)
            Form(
              key:_signUpFormKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 10,),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                  ),
                  const SizedBox(height: 10,),
                  CustomButton(
                    text: 'Sign in', 
                    onTap: () {
                      
                    }
                  )
                ],
              ),
            ),
        ],
      )),
    );
  }
}
