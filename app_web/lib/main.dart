import 'package:flutter/material.dart';
import 'package:testapp/locator.dart';
import 'package:testapp/views/Layout_Template/layout_template.dart';
import 'Widgets/Navigation_Drawer/navigation_drawer.dart';

void main(List<String> args) {
  setupLocator();
  runApp(const MyApp());
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
            const LayoutTemplate() //MyHomePage(title: 'Flutter demo home page'),
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






/*class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyEvent',
        theme: ThemeData(
            primaryColor: Colors.blue,
            textTheme:
                Theme.of(context).textTheme.apply(fontFamily: 'Open Sans')),
        home: const HomeView());
  }
}*/

/*class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context, sizingInformation) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: const Text("Screen 2"),
              shadowColor: Colors.red,
            ),
            drawer: Drawer(
              child: ListView(children: [
                DrawerHeader(
                  child: Column(
                    children: const [
                      Text(
                        'Skill up',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      Text(
                        'Click here',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ]),
            )));
  }
}*/
