import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const LuxeBiteApp());
}

class LuxeBiteApp extends StatelessWidget {
  const LuxeBiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      
      home: SplashScreen(),
    );
  }
}
