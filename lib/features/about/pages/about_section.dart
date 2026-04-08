import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portifolio_mobile/services/language_provider.dart';
import 'package:portifolio_mobile/styles/app_theme.dart';
import 'package:portifolio_mobile/translations/translations.dart';

import '../widgets/timeline_item.dart';

class AboutSection extends ConsumerWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(languageProvider);
    final t = AppTranslations.get(lang);

    final experience = (t['experience'] as List).cast<Map<String, dynamic>>();
    final education = (t['education'] as List).cast<Map<String, dynamic>>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(title: t['about_title'] as String),
          const SizedBox(height: 16),

          // Bio
          Text(
            t['about_bio'] as String,
            style: GoogleFonts.nunito(color: AppColors.textMuted, fontSize: 13, height: 1.7),
          ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.08, end: 0),

          const SizedBox(height: 32),

          // Experience
          _SubHeader(
            icon: FontAwesomeIcons.briefcase,
            label: t['about_experience'] as String,
            color: AppColors.primaryLight,
          ),
          const SizedBox(height: 14),
          ...experience.asMap().entries.map(
            (e) => TimelineItem(
              entry: e.value,
              isLast: e.key == experience.length - 1,
              icon: FontAwesomeIcons.briefcase,
              accentColor: AppColors.primaryLight,
              index: e.key,
            ),
          ),

          const SizedBox(height: 24),

          // Education
          _SubHeader(
            icon: FontAwesomeIcons.graduationCap,
            label: t['about_education'] as String,
            color: AppColors.accentLight,
          ),
          const SizedBox(height: 14),
          ...education.asMap().entries.map(
            (e) => TimelineItem(
              entry: e.value,
              isLast: e.key == education.length - 1,
              icon: FontAwesomeIcons.graduationCap,
              accentColor: AppColors.accentLight,
              index: e.key,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.nunito(
            color: AppColors.white,
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ).animate().fadeIn(duration: 500.ms).slideY(begin: -0.15, end: 0),
        const SizedBox(height: 8),
        Container(
          width: 44,
          height: 3,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [AppColors.primaryLight, AppColors.accentLight]),
            borderRadius: BorderRadius.circular(2),
          ),
        ).animate(delay: 100.ms).fadeIn(duration: 400.ms).slideX(begin: -0.3),
      ],
    );
  }
}

class _SubHeader extends StatelessWidget {
  const _SubHeader({required this.icon, required this.label, required this.color});
  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color.withValues(alpha: 0.3)),
          ),
          child: FaIcon(icon, color: color, size: 14),
        ),
        const SizedBox(width: 10),
        Text(
          label,
          style: GoogleFonts.nunito(color: color, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
