// https://alan.app/docs/tutorials/flutter/navigating-flutter/ 
// -> To add another page and connect it with the Settings button
// https://www.educative.io/answers/how-to-set-the-background-in-flutter
// -> To add a background color
// https://www.youtube.com/watch?v=4pn-_md5Ol4
// -> To add a pop up when 'info' is clicked on the second page
//https://stackoverflow.com/questions/61116601/how-to-reach-a-variable-of-a-class-from-another-class-in-flutter

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'second_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState();
  static _MyAppState of(BuildContext context) => 
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp>  {
 ThemeMode _themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 218, 221, 254),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 39, 59, 124),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(), // standard dark theme
      themeMode: _themeMode,
      home: const MyHomePage(title: 'CompiX'),
      initialRoute: '/',
      routes: {
        '/second': (context) => const SecondPage(),
      },
    );
  }
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
}
ThemeMode getTheme(){
  return _themeMode;
}
}
  
