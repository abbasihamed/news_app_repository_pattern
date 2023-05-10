import 'package:flutter/material.dart';
import 'package:news_repo_pattern/src/presentation/home_screen.dart';

void main(List<String> args) {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tesla News',
      home: HomePage(),
    );
  }
}
