import 'package:flutter/material.dart';
import 'package:flutter_widgets/config/theme/app_theme.dart';
import 'package:flutter_widgets/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColors: 4).getTheme(),
      home: const HomeScreen(),
    );
  }
}
