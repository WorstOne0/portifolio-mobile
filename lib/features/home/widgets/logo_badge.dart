import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
//
import 'package:portifolio_mobile/styles/app_theme.dart';

class LogoBadge extends StatelessWidget {
  const LogoBadge({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primaryLight.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryLight.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: GoogleFonts.nunito(
          fontSize: 12,
          color: AppColors.primaryLight,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    ).animate().fadeIn(duration: 500.ms).slideY(begin: -0.3, end: 0, duration: 500.ms, curve: Curves.easeOut);
  }
}
