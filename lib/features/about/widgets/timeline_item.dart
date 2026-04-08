import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portifolio_mobile/widgets/glass_card.dart';
import 'package:portifolio_mobile/styles/app_theme.dart';

class TimelineItem extends StatelessWidget {
  const TimelineItem({
    super.key,
    required this.entry,
    required this.isLast,
    required this.icon,
    required this.accentColor,
    required this.index,
  });

  final Map<String, dynamic> entry;
  final bool isLast;
  final IconData icon;
  final Color accentColor;
  final int index;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline spine
              SizedBox(
                width: 38,
                child: Column(
                  children: [
                    _TimelineDot(icon: icon, color: accentColor),
                    if (!isLast)
                      Expanded(
                        child: Container(
                          width: 1.5,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                accentColor.withValues(alpha: 0.5),
                                accentColor.withValues(alpha: 0.05),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              // Content card
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: GlassCard(
                    borderColor: accentColor.withValues(alpha: 0.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry['title'] as String,
                          style: GoogleFonts.nunito(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          entry['company'] as String,
                          style: GoogleFonts.nunito(
                            color: accentColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: [
                            _InfoChip(
                              icon: FontAwesomeIcons.calendarDays,
                              label: entry['period'] as String,
                            ),
                            if (entry['duration'] != null)
                              _InfoChip(
                                icon: FontAwesomeIcons.clock,
                                label: entry['duration'] as String,
                              ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        _InfoChip(
                          icon: FontAwesomeIcons.locationDot,
                          label: entry['location'] as String,
                        ),
                        if (entry['description'] != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            entry['description'] as String,
                            style: GoogleFonts.nunito(
                              color: AppColors.textMuted,
                              fontSize: 12,
                              height: 1.55,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
        .animate(delay: Duration(milliseconds: 200 + index * 150))
        .fadeIn(duration: 500.ms)
        .slideX(begin: -0.08, end: 0, duration: 500.ms, curve: Curves.easeOut);
  }
}

class _TimelineDot extends StatelessWidget {
  const _TimelineDot({required this.icon, required this.color});
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        shape: BoxShape.circle,
        border: Border.all(color: color.withValues(alpha: 0.5), width: 1.5),
      ),
      child: Center(child: FaIcon(icon, color: color, size: 13)),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(icon, size: 9, color: AppColors.textMuted),
        const SizedBox(width: 4),
        Text(
          label,
          style: GoogleFonts.nunito(
            color: AppColors.textMuted,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
