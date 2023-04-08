import 'package:app_web/providers/proprio_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_web/locator.dart';
import 'package:app_web/views/Layout_Template/layout_template.dart';
import 'package:provider/provider.dart';
import 'Widgets/Navigation_Drawer/navigation_drawer.dart';

void main(List<String> args) {
  setupLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ProprioProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme:
              Theme.of(context).textTheme.apply(fontFamily: 'Open Sans')),
      home:
          const LayoutTemplate(), //MyHomePage(title: 'Flutter demo home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const NavigationDrawers(),
      body: Stack(
        children: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
          const Center(
            child: Text(
              'Home',
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
    );
  }
}
