import 'package:flutter/material.dart';

class FlockWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlockWidgetState();
  }
}

class _FlockWidgetState extends State<FlockWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Flock'));
  }
}
