import 'package:flutter/material.dart';
import 'package:ghibliapi/src/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ghibli App',
      theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      home: const HomeView(),
    );
  }
}
