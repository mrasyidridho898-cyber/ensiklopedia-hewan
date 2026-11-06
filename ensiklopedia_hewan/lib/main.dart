
import 'package:flutter/material.dart';
import 'views/home_view.dart';

void main() {
  runApp(const EnsiklopediaApp());
}

class EnsiklopediaApp extends StatelessWidget {
  const EnsiklopediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ensiklopedia Hewan',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF244C38),
        ),
      ),
      home: const HomeView(),
    );
  }
}
