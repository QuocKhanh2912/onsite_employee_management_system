import 'package:flutter/material.dart';
import 'dart:math' as math;


class LineCircleFractionPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double fraction;

  LineCircleFractionPainter({
    required this.color,
    required this.strokeWidth,
    required this.fraction,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2.1;

    const startAngle = -math.pi / 2; // Start at 12 o'clock position
    final sweepAngle = 2 * math.pi * fraction;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(LineCircleFractionPainter oldDelegate) =>
      color != oldDelegate.color ||
          strokeWidth != oldDelegate.strokeWidth ||
          fraction != oldDelegate.fraction;
}