import 'package:flutter/material.dart';

void main() { //this runs the app, and in the run app, we can choose what we want to run
  runApp(const MaterialApp( //runs the main app
    debugShowCheckedModeBanner: false,
    home: MainApp()
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

