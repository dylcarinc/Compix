import 'package:flutter/material.dart';
import 'main.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {


  //I am adding new images for different compasses
  final List<Map<String, String>> compassOptions = [
    {"name": "Original Compass","image":"lib/asset/compass.png"},
    {"name": "Gold Compass", "image":"lib/asset/c2.png"},
    {"name": "Drawing Compass", "image":"lib/asset/draw.png"},
    {"name": "Metal Compass", "image":"lib/asset/metallic.png"},
    {"name": "Old Compass", "image":"lib/asset/old.png"},
  ];

  String selectedCompass = "lib/asset/compass.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          ElevatedButton(
            onPressed:(){
              if(MyApp.of(context).getTheme() == ThemeMode.dark){
                MyApp.of(context).changeTheme(ThemeMode.light);
              }
              else{
                MyApp.of(context).changeTheme(ThemeMode.dark);
              }
            },
            child: const Text("Change Dark/Light Mode"),
          ),
          //added dropdown here of different compass options
          DropdownButton<String>(
              value: selectedCompass,
              items: compassOptions.map((option) {
                return DropdownMenuItem<String>(
                  value: option["image"]!,
                  child: Text(option["name"]!),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  Navigator.pop(context, newValue); 
                  }
              },
            ),
          ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("More About The App"),
                  content: const Text("CompiX is an app to act as your compass! Compasses act as a guide to determine where you are facing (North, East, South, or West) and can help you in getting to a new destination. These 4 directions are referred to as the 4 Cardinal directions. The directions in between these 4 are called Ordinal directions. They include norhtwest, northeast, south west, and southeast."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Close"),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text("Info"),
        ),
          ]
        )
      ),
    );
  }
}