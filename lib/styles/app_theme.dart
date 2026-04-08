import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppColors {
  // Primary palette
  static const primary = Color(0xFF0B5ECD);
  static const primaryLight = Color(0xFF3B82F6);

  // Accent palette
  static const accent = Color(0xFF5B21B6);
  static const accentLight = Color(0xFF7C3AED);

  // Backgrounds
  static const background = Color(0xFF090B14);
  static const dark = Color(0xFF111923);
  static const darker = Color(0xFF112034);
  static const sectionAlt = Color(0xFF0D111C);

  // Text
  static const textBase = Color(0xFFD4C2FF);
  static const textMuted = Color(0xFF8892A4);
  static const white = Color(0xFFFFFFFF);

  // Glass
  static const glass = Color(0x0DFFFFFF);
  static const glassBorder = Color(0x17FFFFFF);

  // Project accents
  static const projectBlue = Color(0xFF3B82F6);
  static const projectGreen = Color(0xFF10B981);
  static const projectGray = Color(0xFF94A3B8);

  // Category colors
  static const categoryFrontend = Color(0xFF3B82F6);
  static const categoryBackend = Color(0xFF10B981);
  static const categoryMobile = Color(0xFFF59E0B);
  static const categoryTools = Color(0xFF8B5CF6);

  // Contact colors
  static const contactEmail = Color(0xFF3B82F6);
  static const contactGithub = Color(0xFFA78BFA);
  static const contactLinkedin = Color(0xFF0EA5E9);
}

abstract final class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryLight,
        secondary: AppColors.accentLight,
        surface: AppColors.dark,
        onPrimary: AppColors.white,
        onSurface: AppColors.textBase,
      ),
      textTheme: GoogleFonts.nunitoTextTheme(
        const TextTheme(
          displayLarge: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w800,
          ),
          displayMedium: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          ),
          displaySmall: TextStyle(
            color: AppColors.textBase,
            fontWeight: FontWeight.w600,
          ),
          headlineLarge: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
          ),
          headlineMedium: TextStyle(
            color: AppColors.textBase,
            fontWeight: FontWeight.w600,
          ),
          titleLarge: TextStyle(
            color: AppColors.textBase,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: TextStyle(
            color: AppColors.textMuted,
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: TextStyle(
            color: AppColors.textBase,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
            color: AppColors.textMuted,
            fontWeight: FontWeight.w400,
          ),
          labelLarge: TextStyle(
            color: AppColors.textMuted,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.dark.withValues(alpha: 0.95),
        indicatorColor: AppColors.primaryLight.withValues(alpha: 0.15),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final active = states.contains(WidgetState.selected);
          return GoogleFonts.nunito(
            fontSize: 11,
            fontWeight: active ? FontWeight.w700 : FontWeight.w400,
            color: active ? AppColors.primaryLight : AppColors.textMuted,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final active = states.contains(WidgetState.selected);
          return IconThemeData(
            color: active ? AppColors.primaryLight : AppColors.textMuted,
            size: 22,
          );
        }),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background.withValues(alpha: 0.85),
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.nunito(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        iconTheme: const IconThemeData(color: AppColors.textBase),
      ),
      dividerColor: AppColors.glassBorder,
    );
  }
}
