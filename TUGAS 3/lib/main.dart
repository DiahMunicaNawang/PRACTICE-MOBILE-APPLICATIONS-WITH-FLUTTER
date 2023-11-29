import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(209, 12, 12, 0.986)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Basic Layout-D3TI'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.amber[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              color: Colors.orange[800],
              height: 100,
              width: 40,
              child: Text('1'),
            ),
            Row(
              children: [
                Container(
                  color: Colors.blue, // Warna kotak 2 (biru)
                  height: 50,
                  width: 50,
                  child: Text('2'),
                ),
                Container(
                  color: Colors.purple, // Warna kotak 3 (ungu)
                  height: 50,
                  width: 50,
                  child: Text('3'),
                ),
                Container(
                  color: Colors.green, // Warna kotak 4 (hijau)
                  height: 50,
                  width: 50,
                  child: Text('4'),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    //
                    ),
                Expanded(
                  child: Container(
                      // Container
                      ),
                ),
                Container(
                    // Container
                    ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    // Container
                    ),
                Container(
                    // Container
                    ),
                Container(
                    // Container...
                    ),
              ],
            ),
            Icon(
              Icons.star,
              size: 48,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
