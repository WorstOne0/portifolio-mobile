import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portifolio_mobile/services/language_provider.dart';
import 'package:portifolio_mobile/styles/app_theme.dart';
import 'package:portifolio_mobile/translations/translations.dart';

import '../models/project.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends ConsumerWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(languageProvider);
    final t = AppTranslations.get(lang);

    final projects = (t['projects'] as List)
        .cast<Map<String, dynamic>>()
        .map(Project.fromMap)
        .toList();

    final linkLabels = {
      'frontend': t['projects_link_frontend'] as String,
      'backend': t['projects_link_backend'] as String,
      'dashboard': t['projects_link_dashboard'] as String,
      'live': t['projects_link_live'] as String,
    };

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(title: t['projects_title'] as String),
          const SizedBox(height: 24),
          ...projects.asMap().entries.map(
            (e) => ProjectCard(project: e.value, index: e.key, linkLabels: linkLabels),
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
        ).animate(delay: 100.ms).fadeIn().slideX(begin: -0.3),
      ],
    );
  }
}
