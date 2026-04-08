import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
//
import 'package:portifolio_mobile/styles/app_theme.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key, required this.activeIndex, required this.labels, required this.onTap});

  final int activeIndex;
  final List<String> labels;
  final ValueChanged<int> onTap;

  static const _icons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.user,
    FontAwesomeIcons.code,
    FontAwesomeIcons.briefcase,
    FontAwesomeIcons.envelope,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.dark,
        border: Border(top: BorderSide(color: AppColors.glassBorder, width: 0.5)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 58,
          child: Row(
            children: List.generate(_icons.length, (i) {
              final active = i == activeIndex;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onTap(i),
                  behavior: HitTestBehavior.opaque,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: active ? AppColors.primaryLight.withValues(alpha: 0.15) : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: FaIcon(
                          _icons[i],
                          size: 15,
                          color: active ? AppColors.primaryLight : AppColors.textMuted,
                        ),
                      ),
                      const SizedBox(height: 2),
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: GoogleFonts.nunito(
                          fontSize: 10,
                          fontWeight: active ? FontWeight.w700 : FontWeight.w400,
                          color: active ? AppColors.primaryLight : AppColors.textMuted,
                        ),
                        child: Text(labels[i]),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
