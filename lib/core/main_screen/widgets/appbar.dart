import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
//
import 'package:portifolio_mobile/styles/app_theme.dart';

class PortfolioAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PortfolioAppBar({super.key, required this.lang, required this.onToggle});

  final String lang;
  final VoidCallback onToggle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background.withValues(alpha: 0.82),
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.glassBorder, width: 0.5)),
        ),
      ),
      title: Row(
        children: [
          const FaIcon(FontAwesomeIcons.rocket, color: AppColors.primaryLight, size: 15),
          const SizedBox(width: 8),
          ShaderMask(
            shaderCallback: (bounds) =>
                const LinearGradient(colors: [AppColors.primaryLight, AppColors.accentLight]).createShader(bounds),
            child: Text(
              'LG',
              style: GoogleFonts.nunito(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: onToggle,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.glass,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.glassBorder),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(lang == 'pt' ? '🇧🇷' : '🇺🇸', style: const TextStyle(fontSize: 13)),
                  const SizedBox(width: 5),
                  Text(
                    lang == 'pt' ? 'PT' : 'EN',
                    style: GoogleFonts.nunito(color: AppColors.textBase, fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
