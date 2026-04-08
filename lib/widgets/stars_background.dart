import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../styles/app_theme.dart';

class StarsBackground extends StatefulWidget {
  const StarsBackground({super.key, this.child});

  final Widget? child;

  @override
  State<StarsBackground> createState() => _StarsBackgroundState();
}

class _StarsBackgroundState extends State<StarsBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<_Star> _stars;
  late List<_Comet> _comets;
  final _random = math.Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
    _stars = List.generate(200, (_) => _Star.random(_random));
    _comets = List.generate(3, (_) => _Comet.random(_random));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => CustomPaint(
            painter: _StarsPainter(animValue: _controller.value, stars: _stars, comets: _comets),
            size: Size.infinite,
          ),
        ),
        if (widget.child != null) widget.child!,
      ],
    );
  }
}

// ─── Data Models ─────────────────────────────────────────────────────────────

class _Star {
  _Star({required this.x, required this.y, required this.radius, required this.phaseOffset, required this.speed});

  factory _Star.random(math.Random rng) {
    return _Star(
      x: rng.nextDouble(),
      y: rng.nextDouble(),
      radius: rng.nextDouble() * 1.5 + 0.4,
      phaseOffset: rng.nextDouble() * math.pi * 2,
      speed: rng.nextDouble() * 0.6 + 0.4,
    );
  }

  final double x;
  final double y;
  final double radius;
  final double phaseOffset;
  final double speed;
}

class _Comet {
  _Comet({
    required this.startX,
    required this.startY,
    required this.dx,
    required this.dy,
    required this.color,
    required this.cycleOffset,
    required this.length,
  });

  factory _Comet.random(math.Random rng) {
    final colors = [
      const Color(0xFF67E8F9), // cyan
      const Color(0xFFC084FC), // purple
      const Color(0xFF6EE7B7), // teal
    ];
    return _Comet(
      startX: rng.nextDouble(),
      startY: rng.nextDouble() * 0.5,
      dx: 0.15 + rng.nextDouble() * 0.1,
      dy: 0.05 + rng.nextDouble() * 0.05,
      color: colors[rng.nextInt(colors.length)],
      cycleOffset: rng.nextDouble(),
      length: 0.06 + rng.nextDouble() * 0.06,
    );
  }

  final double startX;
  final double startY;
  final double dx;
  final double dy;
  final Color color;
  final double cycleOffset;
  final double length;
}

// ─── Painter ─────────────────────────────────────────────────────────────────

class _StarsPainter extends CustomPainter {
  _StarsPainter({required this.animValue, required this.stars, required this.comets});

  final double animValue;
  final List<_Star> stars;
  final List<_Comet> comets;

  static const _nebulaColors = [
    Color(0x127C3AED), // purple
    Color(0x0F1D4ED8), // blue
    Color(0x0A0891B2), // cyan
    Color(0x0A5B21B6), // deep purple
  ];

  @override
  void paint(Canvas canvas, Size size) {
    _drawNebulae(canvas, size);
    _drawStars(canvas, size);
    _drawComets(canvas, size);
  }

  void _drawNebulae(Canvas canvas, Size size) {
    final positions = [
      Offset(size.width * 0.15, size.height * 0.2),
      Offset(size.width * 0.8, size.height * 0.15),
      Offset(size.width * 0.5, size.height * 0.6),
      Offset(size.width * 0.2, size.height * 0.85),
    ];
    final radii = [size.width * 0.45, size.width * 0.35, size.width * 0.4, size.width * 0.3];

    for (var i = 0; i < _nebulaColors.length; i++) {
      final paint = Paint()
        ..shader = RadialGradient(
          colors: [_nebulaColors[i], Colors.transparent],
        ).createShader(Rect.fromCircle(center: positions[i], radius: radii[i]));
      canvas.drawCircle(positions[i], radii[i], paint);
    }
  }

  void _drawStars(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    for (final star in stars) {
      final opacity = (math.sin(animValue * math.pi * 2 * star.speed + star.phaseOffset) * 0.35 + 0.65).clamp(0.3, 1.0);
      paint.color = AppColors.white.withValues(alpha: opacity);
      canvas.drawCircle(Offset(star.x * size.width, star.y * size.height), star.radius, paint);
    }
  }

  void _drawComets(Canvas canvas, Size size) {
    for (final comet in comets) {
      final t = ((animValue + comet.cycleOffset) % 1.0);
      if (t > 0.5) continue; // visible only half the cycle

      final progress = t / 0.5; // 0..1 within visible window
      final headX = (comet.startX + comet.dx * progress) % 1.2 * size.width;
      final headY = (comet.startY + comet.dy * progress) * size.height;
      final tailX = headX - comet.dx * comet.length * size.width;
      final tailY = headY - comet.dy * comet.length * size.height;

      final paint = Paint()
        ..shader = LinearGradient(
          colors: [comet.color.withValues(alpha: 0.0), comet.color],
        ).createShader(Rect.fromPoints(Offset(tailX, tailY), Offset(headX, headY)))
        ..strokeWidth = 1.5
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;

      canvas.drawLine(Offset(tailX, tailY), Offset(headX, headY), paint);

      // Head glow
      final glowPaint = Paint()
        ..color = comet.color.withValues(alpha: 0.8)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);
      canvas.drawCircle(Offset(headX, headY), 2, glowPaint);
    }
  }

  @override
  bool shouldRepaint(_StarsPainter old) => old.animValue != animValue;
}
