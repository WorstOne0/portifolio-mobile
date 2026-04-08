import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portifolio_mobile/services/language_provider.dart';
import 'package:portifolio_mobile/styles/app_theme.dart';
import 'package:portifolio_mobile/translations/translations.dart';

import '../widgets/contact_link_card.dart';

const _icons = {
  'Email': FontAwesomeIcons.envelope,
  'GitHub': FontAwesomeIcons.github,
  'LinkedIn': FontAwesomeIcons.linkedin,
};

class ContactSection extends ConsumerWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(languageProvider);
    final t = AppTranslations.get(lang);
    final links = (t['contact_links'] as List).cast<Map<String, dynamic>>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(title: t['contact_title'] as String),
          const SizedBox(height: 12),

          Text(
            t['contact_subtitle'] as String,
            style: GoogleFonts.nunito(color: AppColors.textMuted, fontSize: 13, height: 1.65),
          ).animate(delay: 100.ms).fadeIn(duration: 400.ms),

          const SizedBox(height: 36),

          Center(
            child: const _OrbitalDecoration()
                .animate(delay: 200.ms)
                .fadeIn(duration: 600.ms)
                .scale(
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1, 1),
                  duration: 600.ms,
                  curve: Curves.elasticOut,
                ),
          ),

          const SizedBox(height: 36),

          ...links.asMap().entries.map((e) {
            final link = e.value;
            final label = link['label'] as String;
            final hexStr = (link['colorHex'] as String).replaceFirst('#', 'FF');
            final color = Color(int.parse(hexStr, radix: 16));
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ContactLinkCard(
                label: label,
                value: link['value'] as String,
                url: link['url'] as String,
                icon: _icons[label] ?? FontAwesomeIcons.link,
                color: color,
                index: e.key,
              ),
            );
          }),

          const SizedBox(height: 40),

          Center(
            child: Text(
              '< built with Flutter & ♥ />',
              style: GoogleFonts.firaCode(
                color: AppColors.textMuted.withValues(alpha: 0.45),
                fontSize: 11,
              ),
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
        ).animate(delay: 100.ms).fadeIn().slideX(begin: -0.3),
      ],
    );
  }
}

class _OrbitalDecoration extends StatefulWidget {
  const _OrbitalDecoration();

  @override
  State<_OrbitalDecoration> createState() => _OrbitalDecorationState();
}

class _OrbitalDecorationState extends State<_OrbitalDecoration> with TickerProviderStateMixin {
  late final AnimationController _ring1;
  late final AnimationController _ring2;
  late final AnimationController _ring3;

  @override
  void initState() {
    super.initState();
    _ring1 = AnimationController(vsync: this, duration: const Duration(seconds: 7))..repeat();
    _ring2 = AnimationController(vsync: this, duration: const Duration(seconds: 13))
      ..repeat(reverse: true);
    _ring3 = AnimationController(vsync: this, duration: const Duration(seconds: 22))..repeat();
  }

  @override
  void dispose() {
    _ring1.dispose();
    _ring2.dispose();
    _ring3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _ring3,
            builder: (context, child) => CustomPaint(
              size: const Size(184, 184),
              painter: _RingPainter(
                angle: _ring3.value * 2 * math.pi,
                radius: 90,
                color: AppColors.accentLight,
                dotCount: 4,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _ring2,
            builder: (context, child) => CustomPaint(
              size: const Size(136, 136),
              painter: _RingPainter(
                angle: -_ring2.value * 2 * math.pi,
                radius: 66,
                color: AppColors.primaryLight,
                dotCount: 3,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _ring1,
            builder: (context, child) => CustomPaint(
              size: const Size(88, 88),
              painter: _RingPainter(
                angle: _ring1.value * 2 * math.pi,
                radius: 42,
                color: AppColors.accentLight,
                dotCount: 2,
              ),
            ),
          ),
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primaryLight.withValues(alpha: 0.3),
                  AppColors.primary.withValues(alpha: 0.05),
                ],
              ),
              border: Border.all(color: AppColors.primaryLight.withValues(alpha: 0.4)),
            ),
            child: const Center(
              child: FaIcon(FontAwesomeIcons.envelope, color: AppColors.primaryLight, size: 22),
            ),
          ),
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  const _RingPainter({
    required this.angle,
    required this.radius,
    required this.color,
    required this.dotCount,
  });

  final double angle;
  final double radius;
  final Color color;
  final int dotCount;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = color.withValues(alpha: 0.25)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );

    final dotPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);

    for (var i = 0; i < dotCount; i++) {
      final dotAngle = angle + (i / dotCount) * 2 * math.pi;
      canvas.drawCircle(
        Offset(center.dx + radius * math.cos(dotAngle), center.dy + radius * math.sin(dotAngle)),
        3,
        dotPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.angle != angle;
}
