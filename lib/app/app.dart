import 'package:flutter/material.dart';
import '../home/home.dart';

class MyUtilityApp extends StatelessWidget {
  const MyUtilityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Utility App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
