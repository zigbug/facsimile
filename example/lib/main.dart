import 'dart:io';
import 'package:facsimile/facsimile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  late Uint8List bytes;
  late Uint8List bytes2;
  late File file;
  int i = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      makeB();
    });
    setState(() {});
  }

  Future<void> makeB() async {
    var buf = await rootBundle.load('assets/img1_137.jpg'); //
    bytes = buf.buffer.asUint8List();
    i++;
    setState(() {});
  }

  Future<void> doIt() async {
    //  file = File((await getApplicationDocumentsDirectory()).toString());
    bytes = (await Facsimile().removeBackground(bytes))!;

    i++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many timпes: $i',
            ),
            Stack(children: [
              Container(
                color: Colors.green,
                width: 900,
                height: 700,
              ),
              if (i == 1)
                Image.memory(bytes)
              else if (i == 2)
                Image.memory(bytes),
            ]),
            Text(
              'prrr',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (i == 0) {
            await makeB();
          } else {
            doIt();
            setState(() {});
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.remove_circle),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
