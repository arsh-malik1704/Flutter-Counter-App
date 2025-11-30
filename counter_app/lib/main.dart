import 'package:flutter/material.dart';
import 'splash_screen.dart';

const Color counterPrimaryColor = Color(0xFF673AB7);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: counterPrimaryColor,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: counterPrimaryColor,
          primary: counterPrimaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: counterPrimaryColor,
          foregroundColor: Colors.white,
          elevation: 4,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}