import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/components/medium_button.dart';
import 'package:flutter_recipe_app/presentation/components/small_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: SmallButton(text: 'Button', onClick: () {})),
      ),
    );
  }
}
