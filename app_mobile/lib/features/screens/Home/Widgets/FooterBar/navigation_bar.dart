import 'package:flutter/material.dart';

import 'package:myevent/features/screens/Home/Widgets/Body/home_display.dart';

import 'package:myevent/features/screens/Login/login_view.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}
class _NavBarState extends State<NavBar> {
  
  int _page = 0;

  List<Widget> pages = [
    const EtbDisplay(),
    const LoginView()
  ];

  void updatePage(int page){
    setState(() {
      _page = page;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    
    return Scaffold(
  body: pages[_page],
  bottomNavigationBar: Container(
    margin: EdgeInsets.fromLTRB(2 * fem, 0 * fem, 1 * fem, 0 * fem),
    width: double.infinity,
    height: 72 * fem,
    decoration: BoxDecoration(
      color: Color(0xfff6f8fe),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32 * fem),
        topRight: Radius.circular(32 * fem),
      ),
    ),
    child: BottomNavigationBar(
      onTap: updatePage,
      currentIndex: _page,
      iconSize: 28.0,
      selectedFontSize: 12.0,
      unselectedFontSize: 11.0,
      selectedIconTheme: const IconThemeData(size: 30.0),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedLabelStyle: const TextStyle(color: Colors.black54),
      unselectedItemColor: Colors.black54,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Accueil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Compte',
        ),
      ],
    ),
  ),
);

    
  }
}
