import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portifolio_mobile/features/home/widgets/cta_button.dart';
import 'package:portifolio_mobile/features/home/widgets/logo_badge.dart';
import 'package:portifolio_mobile/services/language_provider.dart';
import 'package:portifolio_mobile/styles/app_theme.dart';
import 'package:portifolio_mobile/translations/translations.dart';
import 'package:portifolio_mobile/utils/context_extensions.dart';
import 'package:simple_icons/simple_icons.dart';

import '../widgets/tech_icon_card.dart';

const _techStack = [
  (FontAwesomeIcons.react, 'React', Color(0xFF61DAFB)),
  (FontAwesomeIcons.nodeJs, 'Node.js', Color(0xFF68A063)),
  (FontAwesomeIcons.docker, 'Docker', Color(0xFF2496ED)),
  (FontAwesomeIcons.python, 'Python', Color(0xFFFFD43B)),
  (FontAwesomeIcons.vuejs, 'Vue.js', Color(0xFF4FC08D)),
  (FontAwesomeIcons.gitAlt, 'Git', Color(0xFFF05032)),
  (FontAwesomeIcons.flutter, 'Flutter', Color(0xFF54C5F8)),
  (FontAwesomeIcons.js, 'JavaScript', Color(0xFFF7DF1E)),
  (FontAwesomeIcons.leaf, 'MongoDB', Color(0xFF47A248)),
  (SimpleIcons.firebase, 'Firebase', Color(0xFFFFCA28)),
  (SimpleIcons.tailwindcss, 'Tailwind', Color(0xFF38BDF8)),
  (SimpleIcons.typescript, 'TypeScript', Color(0xFF3178C6)),
];

class HomeSection extends ConsumerWidget {
  const HomeSection({super.key, this.onCtaTap});

  final VoidCallback? onCtaTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(languageProvider);
    final translations = AppTranslations.get(lang);

    return Container(
      height: context.screenHeight - kToolbarHeight - kBottomNavigationBarHeight - 48,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Badge
          LogoBadge(text: translations['hero_badge'] as String),
          const SizedBox(height: 20),

          // Name with gradient
          Text(
            translations['hero_name'] as String,
            style: GoogleFonts.nunito(
              fontSize: 38,
              fontWeight: FontWeight.w800,
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [Color(0xFF3B82F6), Color(0xFFA78BFA)],
                ).createShader(const Rect.fromLTWH(0, 0, 300, 50)),
            ),
          ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.2, end: 0, duration: 600.ms, curve: Curves.easeOut),

          const SizedBox(height: 4),

          // Title (Computer Engineer)
          Text(
            translations['hero_title'] as String,
            style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
              letterSpacing: 1.5,
            ),
          ).animate(delay: 100.ms).fadeIn(duration: 500.ms).slideY(begin: -0.15, end: 0),

          const SizedBox(height: 2),

          // Role (Full-Stack Developer)
          Text(
            translations['hero_role'] as String,
            style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.primaryLight),
          ).animate(delay: 200.ms).fadeIn(duration: 500.ms).slideY(begin: -0.15, end: 0),

          const SizedBox(height: 16),

          // Subtitle
          Text(
            translations['hero_subtitle'] as String,
            style: GoogleFonts.nunito(fontSize: 14, color: AppColors.textMuted, height: 1.65),
          ).animate(delay: 300.ms).fadeIn(duration: 500.ms).slideY(begin: 0.1, end: 0),

          const SizedBox(height: 28),

          // CTA button
          CtaButton(
            label: translations['hero_cta'] as String,
            onTap: onCtaTap,
          ).animate(delay: 400.ms).fadeIn(duration: 500.ms).slideY(begin: 0.2, end: 0),

          const SizedBox(height: 44),

          // Tech stack label
          Text(
            '<tech />',
            style: GoogleFonts.firaCode(
              fontSize: 12,
              color: AppColors.accentLight.withValues(alpha: 0.7),
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 14),

          // Tech grid
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (var i = 0; i < _techStack.length; i++)
                TechIconCard(
                  icon: _techStack[i].$1,
                  label: _techStack[i].$2,
                  color: _techStack[i].$3,
                  delay: Duration(milliseconds: 480 + i * 55),
                ),
            ],
          ),

          const SizedBox(height: 14),

          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 15,
                children: [
                  RotatedBox(quarterTurns: 2, child: Icon(Icons.rocket, size: 16, color: AppColors.textMuted))
                      .animate(onPlay: (controller) => controller.repeat())
                      .slideY(begin: 0, end: 0.3, duration: 1000.ms, curve: Curves.easeInOut)
                      .slideY(begin: 0.3, end: 0, delay: 1000.ms, duration: 1000.ms, curve: Curves.easeInOut),
                  Text(
                    "Scroll Down".toUpperCase(),
                    style: GoogleFonts.nunito(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textMuted,
                      height: 1.65,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
