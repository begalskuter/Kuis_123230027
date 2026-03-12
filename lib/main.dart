import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/screen/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Latihan Kuis E',
      home: const LoginPage(),
    );
  }
}