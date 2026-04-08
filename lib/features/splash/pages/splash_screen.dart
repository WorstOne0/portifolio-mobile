import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portifolio_mobile/styles/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _fadeOut;

  @override
  void initState() {
    super.initState();

    _fadeOut = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    // Begin fade-out after the entrance animations settle
    Future.delayed(const Duration(milliseconds: 2100), () {
      if (mounted) _fadeOut.forward();
    });

    // Navigate when fade-out is complete
    Future.delayed(const Duration(milliseconds: 2700), () {
      if (mounted) context.go('/');
    });
  }

  @override
  void dispose() {
    _fadeOut.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: FadeTransition(
        opacity: Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(parent: _fadeOut, curve: Curves.easeOut)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Main content
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _RocketGlow(),

                const SizedBox(height: 10),

                Text(
                      'Lucca Gabriel',
                      style: GoogleFonts.nunito(
                        color: AppColors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                      ),
                    )
                    .animate(delay: 500.ms)
                    .fadeIn(duration: 500.ms)
                    .slideY(begin: 0.25, end: 0, duration: 500.ms, curve: Curves.easeOut),

                const SizedBox(height: 8),

                Text(
                      '< PORTFOLIO />',
                      style: GoogleFonts.firaCode(color: AppColors.primaryLight, fontSize: 14, letterSpacing: 2),
                    )
                    .animate(delay: 750.ms)
                    .fadeIn(duration: 450.ms)
                    .slideY(begin: 0.2, end: 0, duration: 450.ms, curve: Curves.easeOut),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RocketGlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer glow ring — pulses
        Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [AppColors.primaryLight.withValues(alpha: 0.22), Colors.transparent]),
              ),
            )
            .animate(onPlay: (c) => c.repeat(reverse: true))
            .scaleXY(begin: 0.85, end: 1.15, duration: 1200.ms, curve: Curves.easeInOut)
            .fadeIn(duration: 300.ms),

        // Inner glow
        Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.primary.withValues(alpha: 0.18)),
            )
            .animate(onPlay: (c) => c.repeat(reverse: true))
            .scaleXY(begin: 0.9, end: 1.1, duration: 900.ms, curve: Curves.easeInOut),

        // Rocket icon
        const FaIcon(
          FontAwesomeIcons.rocket,
          color: AppColors.primaryLight,
          size: 44,
        ).animate().scaleXY(begin: 0.2, end: 1.0, duration: 600.ms, curve: Curves.elasticOut).fadeIn(duration: 300.ms),
      ],
    );
  }
}
