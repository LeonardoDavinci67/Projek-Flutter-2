
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const TomoroApp());
}

class TomoroApp extends StatelessWidget {
  const TomoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TOMORO COFFEE',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF15A24),
        ),
      ),
      home: const HomePage(),
    );
  }
}
