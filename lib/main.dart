// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/game_controller.dart';
import 'screens/game_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameController(),
      child: MaterialApp(
        title: 'Flutter Stateful Billiards Counter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const GameScreen(),
      ),
    );
  }
}
