import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portifolio_mobile/services/url_launcher_service.dart';
import 'package:portifolio_mobile/styles/app_theme.dart';

class ContactLinkCard extends StatefulWidget {
  const ContactLinkCard({
    super.key,
    required this.label,
    required this.value,
    required this.url,
    required this.icon,
    required this.color,
    required this.index,
  });

  final String label;
  final String value;
  final String url;
  final IconData icon;
  final Color color;
  final int index;

  @override
  State<ContactLinkCard> createState() => _ContactLinkCardState();
}

class _ContactLinkCardState extends State<ContactLinkCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTapDown: (_) => setState(() => _pressed = true),
          onTapUp: (_) => setState(() => _pressed = false),
          onTapCancel: () => setState(() => _pressed = false),
          onTap: () => UrlLauncherService.open(widget.url),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            transform: Matrix4.translationValues(0, _pressed ? 2 : 0, 0),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _pressed ? widget.color.withValues(alpha: 0.12) : AppColors.glass,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _pressed ? widget.color.withValues(alpha: 0.5) : AppColors.glassBorder),
            ),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: widget.color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: widget.color.withValues(alpha: 0.3)),
                  ),
                  child: Center(child: FaIcon(widget.icon, color: widget.color, size: 17)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.label,
                        style: GoogleFonts.nunito(
                          color: widget.color,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.4,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.value,
                        style: GoogleFonts.nunito(color: AppColors.textMuted, fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                FaIcon(FontAwesomeIcons.arrowRight, size: 13, color: widget.color.withValues(alpha: 0.55)),
              ],
            ),
          ),
        )
        .animate(delay: Duration(milliseconds: 200 + widget.index * 120))
        .fadeIn(duration: 450.ms)
        .slideX(begin: -0.08, end: 0, duration: 450.ms, curve: Curves.easeOut);
  }
}
