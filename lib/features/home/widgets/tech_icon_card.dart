import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portifolio_mobile/styles/app_theme.dart';

class TechIconCard extends StatefulWidget {
  const TechIconCard({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    this.delay = Duration.zero,
  });

  final IconData icon;
  final String label;
  final Color color;
  final Duration delay;

  @override
  State<TechIconCard> createState() => _TechIconCardState();
}

class _TechIconCardState extends State<TechIconCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
        decoration: BoxDecoration(
          color: _hovered ? widget.color.withValues(alpha: 0.12) : AppColors.glass,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _hovered ? widget.color.withValues(alpha: 0.5) : AppColors.glassBorder,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(widget.icon, color: widget.color, size: 18),
            const SizedBox(width: 7),
            Text(
              widget.label,
              style: GoogleFonts.nunito(
                color: _hovered ? widget.color : AppColors.textMuted,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    )
        .animate(delay: widget.delay)
        .fadeIn(duration: 400.ms)
        .slideY(begin: 0.15, end: 0, duration: 400.ms, curve: Curves.easeOut);
  }
}
