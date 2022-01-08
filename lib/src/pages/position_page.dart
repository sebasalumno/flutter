import 'package:flutter/material.dart';

class PositionPage extends StatefulWidget {
  @override
  _positionPageState createState() => _positionPageState();
}

class _positionPageState extends State<PositionPage> {
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
