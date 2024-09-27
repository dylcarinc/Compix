// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:ffi';

import 'package:compix/home_page.dart';
import 'package:compix/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:compix/main.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  testWidgets('Compass shows circular progress indicator if it cannot find value', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final avatarFinder = find.byType(CircularProgressIndicator);
    expect(avatarFinder,findsOneWidget);
  });

  testWidgets('Compass image is shown', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home :Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("test"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('In Degrees'),
                Text(
                  5.0.toInt().toString(),
                ),
                const SizedBox(height: 50),
                AnimatedRotation(
                  turns: 0,
                  duration: const Duration(milliseconds: 250),
                  child: Image.asset(
                    "lib/asset/compass.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),)

    )); 
    final imageFinder = find.byType(Image);
    expect(imageFinder,findsOneWidget);
  });
  testWidgets('Compass reading is shown without null value', (WidgetTester tester) async {
    final textFinder = find.text("null");
    expect(textFinder,findsNothing);
  });
  testWidgets('Second page has info section', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            var context;
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
      ),
    )));
    final textFinder = find.text("Info");
    expect(textFinder,findsOneWidget);
  });
}