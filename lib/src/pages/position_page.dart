import 'package:flutter/material.dart';

class PositioPage extends StatefulWidget {
  @override
  _positionPageState createState() => _positionPageState();
}

class _positionPageState extends State<PositioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Posiciones de trabajo'),
      ),
    );
  }
}
