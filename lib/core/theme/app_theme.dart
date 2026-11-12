import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF165DFC);
  static const primaryDark = Color(0xFF0C3FA9);
  static const primaryLight = Color(0xFF4B87FF);
  static const sky = Color(0xFFEFF4FF);
  static const background = Color(0xFFF4F7FC);
  static const text = Color(0xFF162238);
  static const muted = Color(0xFF64748B);
  static const green = Color(0xFF10A875);
  static const greenLight = Color(0xFFEBF9F1);
  static const orange = Color(0xFFFF8A32);
  static const orangeLight = Color(0xFFFFF3E5);
  static const purple = Color(0xFF7C3AED);
  static const purpleLight = Color(0xFFF3EDFF);
  static const red = Color(0xFFEF4444);
  static const redLight = Color(0xFFFFECEC);
  static const pink = Color(0xFFEC4899);
  static const pinkLight = Color(0xFFFFECF3);
  static const teal = Color(0xFF0D9488);
  static const tealLight = Color(0xFFEBFBF5);
  static const border = Color(0xFFE8EEF7);

  static const headerGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF0D4CC9), Color(0xFF165DFC)],
  );

  static const cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1256E3), Color(0xFF0B3A9B)],
  );
}

class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.text,
          elevation: 0,
          centerTitle: false,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.text),
          titleLarge: TextStyle(fontSize: 19, fontWeight: FontWeight.w800, color: AppColors.text),
          titleMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.text),
          bodyMedium: TextStyle(fontSize: 14, color: AppColors.text),
          bodySmall: TextStyle(fontSize: 12, color: AppColors.muted),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: AppColors.border)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(color: AppColors.primary, width: 1.5)),
        ),
      );
}
