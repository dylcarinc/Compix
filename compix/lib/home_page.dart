// https://stackoverflow.com/questions/69462733/animatedrotation-for-animating-compass
// -> Animation for the compass

import 'package:compix/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:permission_handler/permission_handler.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double prevValue = 0.0;
  double turns = 0.0;
  String compassImage = "lib/asset/compass.png";

  @override
  void initState() {
    super.initState();
    Permission.locationWhenInUse.request();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error reading heading: ${snapshot.error}');
        }

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        double? direction = snapshot.data!.heading;
        direction = direction! < 0 ? (360 + direction) : direction;

        double diff = direction - prevValue;
        if (diff.abs() > 180) {
          if (prevValue > direction) {
            diff = 360 - (direction - prevValue).abs();
          } else {
            diff = 360 - (prevValue - direction).abs();
            diff = diff * -1;
          }
        }
        turns += (diff / 360);
        prevValue = direction;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('In Degrees'),
                Text(
                  direction.toInt().toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 50),
                AnimatedRotation(
                  turns: - turns,
                  duration: const Duration(milliseconds: 250),
                  child: Image.asset(
                    //available compasses
                    compassImage,
                    //"lib/asset/compass.png",
                    //"lib/asset/draw.png",
                    //"lib/asset/metallic.png",
                    //"lib/asset/old.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final selectedCompass = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              );
              if (selectedCompass != null && selectedCompass is String) {
                setState(() {
                  compassImage = selectedCompass;
                });
              }
            },
            tooltip: 'Settings',
            child: const Icon(Icons.settings),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        );
      },
    );
  }
}