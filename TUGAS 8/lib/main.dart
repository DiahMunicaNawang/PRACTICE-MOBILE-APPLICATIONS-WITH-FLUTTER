import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(Smartphone());
}

class Smartphone extends StatelessWidget {
  const Smartphone({Key? key}) : super(key: key);

  static const String _title = 'Pembuatan Animation';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  MyStatefulWidgetState createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat();

  bool _currentState = false;
  bool _reverse = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desti Nur Fauzi R Gesture"),
        backgroundColor: Color.fromARGB(255, 134, 20, 129),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _reverse = !_reverse;
                if (_reverse) {
                  controller.forward();
                } else {
                  controller.reverse();
                }
              },
              child: AnimatedBuilder(
                animation: controller,
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: controller.value * 2.0 * math.pi,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('lib/img/g5.jpg'),
                    ),
                  );
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(20.0)),
            GestureDetector(
              onDoubleTap: () {
                print(_currentState);
                setState(() {
                  // Toggle light when tapped.
                  _currentState = !_currentState;
                  if (_currentState == true) {
                    controller.stop();
                  } else {
                    controller.repeat();
                  }
                });
              },
              child: Container(
                width: 78.0,
                height: 80.0,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 134, 28, 129),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_currentState ? Icons.play_arrow : Icons.stop_circle),
                    Text(_currentState ? 'Putar' : 'Stop'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
