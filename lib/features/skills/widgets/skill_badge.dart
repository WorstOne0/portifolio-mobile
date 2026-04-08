import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portifolio_mobile/styles/app_theme.dart';

import '../data/skill_data.dart';

// ─── Individual skill badge ───────────────────────────────────────────────────

class SkillBadge extends StatelessWidget {
  const SkillBadge({super.key, required this.skill, required this.categoryColor, required this.globalIndex});

  final SkillItem skill;
  final Color categoryColor;
  final int globalIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: skill.color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: skill.color.withValues(alpha: 0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SkillIcon(skill: skill),
              const SizedBox(width: 7),
              Text(
                skill.name,
                style: GoogleFonts.nunito(color: AppColors.textBase, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        )
        .animate(delay: Duration(milliseconds: 80 + globalIndex * 40))
        .fadeIn(duration: 300.ms)
        .scale(begin: const Offset(0.85, 0.85), end: const Offset(1, 1), duration: 300.ms, curve: Curves.easeOut);
  }
}

class _SkillIcon extends StatelessWidget {
  const _SkillIcon({required this.skill});
  final SkillItem skill;

  @override
  Widget build(BuildContext context) {
    return Icon(skill.faIcon!, size: 13, color: skill.color);
  }
}

// ─── Category card ────────────────────────────────────────────────────────────

class SkillCategoryCard extends StatelessWidget {
  const SkillCategoryCard({
    super.key,
    required this.category,
    required this.name,
    required this.description,
    required this.categoryIndex,
  });

  final SkillCategory category;
  final String name;
  final String description;
  final int categoryIndex;

  @override
  Widget build(BuildContext context) {
    // Calculate global index offset for stagger animations
    final indexOffset = categoryIndex * 12;

    return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.glass,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: category.color.withValues(alpha: 0.25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category header with icon + name + description
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: category.color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: category.color.withValues(alpha: 0.3)),
                    ),
                    child: FaIcon(category.categoryIcon, size: 15, color: category.color),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: GoogleFonts.nunito(color: category.color, fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          description,
                          style: GoogleFonts.nunito(
                            color: AppColors.textMuted,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Divider
              Container(
                height: 1,
                color: category.color.withValues(alpha: 0.12),
                margin: const EdgeInsets.only(bottom: 14),
              ),

              // Skill badges
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: category.skills.asMap().entries.map((e) {
                  return SkillBadge(skill: e.value, categoryColor: category.color, globalIndex: indexOffset + e.key);
                }).toList(),
              ),
            ],
          ),
        )
        .animate(delay: Duration(milliseconds: 150 + categoryIndex * 100))
        .fadeIn(duration: 450.ms)
        .slideY(begin: 0.08, end: 0, duration: 450.ms, curve: Curves.easeOut);
  }
}
