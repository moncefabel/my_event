import 'package:flutter/material.dart';

import 'Widgets/FooterBar/navigation_bar.dart';




class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // double baseWidth = 375;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    // return Container(
    //   width: double.infinity,
    //   child: Container(
    //     // homeL1j (1:360)
    //     padding: EdgeInsets.fromLTRB(22 * fem, 40 * fem, 23 * fem, 18 * fem),
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //       color: Color(0xfffefefe),
    //     ),
        return Scaffold(
<<<<<<< HEAD
         // debugShowCheckedModeBanner: false,
=======
>>>>>>> 3f1b94e99955ab3b4555978be27ce2593ed96a29
          body: NavBar()         
        );
    //   ),
    // );
  }
}
