// https://alan.app/docs/tutorials/flutter/navigating-flutter/ 
// -> To add another page and connect it with the Settings button
// https://www.educative.io/answers/how-to-set-the-background-in-flutter
// -> To add a background color
// https://stackoverflow.com/questions/78037245/how-to-create-a-popup-widget-in-flutter
// -> To add a pop up when 'info' is clicked

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 39, 59, 124),),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CampiX'),
      initialRoute: '/',
      routes: {
        '/second': (context) => const SecondPage(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class PopUpScreen extends StatefulWidget {
  PopUpScreen({super.key});
  
  set showPopUp(bool showPopUp) {}

  @override
  State<PopUpScreen> createState() => _PopUpScreenState();
}

class _PopUpScreenState extends State<PopUpScreen> {
  var showPopUp = false; // Move this here
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text("Info"),
            onPressed: () {
              setState(() {
                  widget.showPopUp = true;
                });
            }
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});
  
  @override
  // ignore: library_private_types_in_public_api
  _SecondPageState createState() => _SecondPageState();
  
}

// Add a second page

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final int _counter = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'In Degrees',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
        tooltip: 'Settings',
        child: const Icon(Icons.settings),
      ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}