import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myevent/features/screens/Home/Widgets/Body/etablissements_display.dart';
import 'package:myevent/features/screens/Home/home.dart';
import 'package:myevent/features/screens/Login/login_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}
class _NavBarState extends State<NavBar> {
  
  int _page = 0;

  List<Widget> pages = [
    const EtbDisplay(),
    const LoginScreen()
  ];

  void updatePage(int page){
    setState(() {
      _page = page;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: updatePage,
        backgroundColor: Colors.white,
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
              icon: Icon(Icons.home_filled), label: 'Accueil'),
          
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Compte'),
        ]),
    );
  }
}
