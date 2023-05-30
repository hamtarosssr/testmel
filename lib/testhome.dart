import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easy Home Page'),
      ),
      body: Center(
        child: Text(
          'Welcome to my home page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}