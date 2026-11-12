import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'screens/splash_screen.dart';

class TrishalApp extends StatelessWidget {
  const TrishalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ত্রিশাল',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const SplashScreen(),
    );
  }
}
