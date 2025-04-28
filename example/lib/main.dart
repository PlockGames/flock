import 'package:flock/flock.dart';
import 'package:flock/flock_category.dart';
import 'package:flutter/material.dart';
import 'package:test/blocks/block_if.dart';
import 'package:test/blocks/block_spawn_object.dart';
import 'package:test/blocks/block_true.dart';

List<FlockCategory> blockbox = [
  FlockCategory(name: 'Logic', children: [blockIf, blockTrue]),
  FlockCategory(name: 'objects', children: [blockSpawnObject]),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flock Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flock Demo'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(child: FlockWidget(blockbox: blockbox)),
    );
  }
}
