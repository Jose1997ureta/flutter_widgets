import 'package:flutter/material.dart';
import 'package:flutter_widgets/config/router/app_router.dart';
import 'package:flutter_widgets/config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColors: 1).getTheme(),
    );
  }
}
