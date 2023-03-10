import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return BottomNavigationBar(
        
        backgroundColor: Colors.white,
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
        ]);
  }
}
