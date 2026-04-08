import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portifolio_mobile/services/url_launcher_service.dart';
import 'package:portifolio_mobile/styles/app_theme.dart';

import '../models/project.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
    required this.index,
    required this.linkLabels,
  });

  final Project project;
  final int index;
  final Map<String, String> linkLabels;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: AppColors.glass,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: project.accent.withValues(alpha: 0.25)),
      ),
      clipBehavior: Clip.hardEdge, // ensures header corners match card corners
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Full-width visual header
          _ProjectHeader(project: project),

          // Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Type tag
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: project.accent.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    project.type,
                    style: GoogleFonts.nunito(
                      color: project.accent,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Description
                Text(
                  project.description,
                  style: GoogleFonts.nunito(color: AppColors.textMuted, fontSize: 13, height: 1.6),
                ),

                const SizedBox(height: 14),

                // Tech stack
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: project.tech.map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.darker,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.glassBorder),
                      ),
                      child: Text(
                        tech,
                        style: GoogleFonts.firaCode(color: AppColors.textMuted, fontSize: 10),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 16),

                // Links
                _ProjectLinks(links: project.links, accent: project.accent, labels: linkLabels),
              ],
            ),
          ),
        ],
      ),
    )
        .animate(delay: Duration(milliseconds: 200 + index * 150))
        .fadeIn(duration: 500.ms)
        .slideY(begin: 0.08, end: 0, duration: 500.ms, curve: Curves.easeOut);
  }
}

// Full-width gradient header
class _ProjectHeader extends StatelessWidget {
  const _ProjectHeader({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            project.accent.withValues(alpha: 0.28),
            project.accent.withValues(alpha: 0.06),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Big watermark number
          Positioned(
            right: 12,
            bottom: -10,
            child: Text(
              project.number,
              style: GoogleFonts.nunito(
                fontSize: 88,
                fontWeight: FontWeight.w800,
                color: project.accent.withValues(alpha: 0.13),
                height: 1,
              ),
            ),
          ),

          // Project name + number label
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '#${project.number}',
                  style: GoogleFonts.firaCode(
                    color: project.accent.withValues(alpha: 0.7),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  project.name,
                  style: GoogleFonts.nunito(
                    color: AppColors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectLinks extends StatelessWidget {
  const _ProjectLinks({required this.links, required this.accent, required this.labels});
  final Map<String, String> links;
  final Color accent;
  final Map<String, String> labels;

  static const _icons = {
    'frontend': FontAwesomeIcons.github,
    'backend': FontAwesomeIcons.github,
    'dashboard': FontAwesomeIcons.github,
    'live': FontAwesomeIcons.arrowUpRightFromSquare,
  };

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: links.entries.map((e) {
        return _LinkButton(
          label: labels[e.key] ?? e.key,
          icon: _icons[e.key] ?? FontAwesomeIcons.link,
          url: e.value,
          accent: accent,
        );
      }).toList(),
    );
  }
}

class _LinkButton extends StatelessWidget {
  const _LinkButton({required this.label, required this.icon, required this.url, required this.accent});
  final String label;
  final IconData icon;
  final String url;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => UrlLauncherService.open(url),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: accent.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: accent.withValues(alpha: 0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(icon, size: 12, color: accent),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.nunito(color: accent, fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
