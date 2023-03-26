import 'package:flutter/material.dart';
import 'package:myevent/features/screens/Params/log_out_button.dart';
import 'package:myevent/features/screens/Home/home.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/utils.dart';
import '../../auth/services/auth_service.dart';
import '../Home/Widgets/Body/home_display.dart';

class MylogoutPage extends StatefulWidget {
  const MylogoutPage({Key? key}) : super(key: key);

  @override
  _MylogoutPageState createState() => _MylogoutPageState();
}

class _MylogoutPageState extends State<MylogoutPage> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('MyEvent'),
              accountEmail: null,
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'ME',
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xff4c9fc1),
              ),
              margin: EdgeInsets.zero,
              onDetailsPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: const Text('Home'),
                leading: const Icon(Icons.home),
                onTap: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: const Text('Logout'),
                leading: const Icon(Icons.logout),
                onTap: () {
                  AuthService().logOut(context);
                },
              ),
            ),
          ],
        ),
      );
    
  }
}