import 'package:flutter/material.dart';

class DummyScreen extends StatelessWidget {
  final String text;

  const DummyScreen({Key? key, this.text = "Dummy Screen"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: Center(
        child: Text(text),
      ),
    );
  }
}
