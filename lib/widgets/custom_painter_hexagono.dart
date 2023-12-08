import 'package:flutter/material.dart';

import 'dart:math' as math;

class HexagonoWidget extends StatelessWidget {
  const HexagonoWidget({Key? key, this.icon, this.color}) : super(key: key);
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 110,
      child: CustomPaint(
        painter: Hexagono(color: color),
        child: icon != null ? Icon(icon, size: 100 / 2) : Container(),
      ),
    );
  }
}

class Hexagono extends CustomPainter {
  final Color? color;

  Hexagono({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = (color ?? Colors.blue)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final path = Path();
    path
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height * .25)
      ..lineTo(size.width, size.height * .75)
      ..lineTo(size.width * .5, size.height)
      ..lineTo(0, size.height * .75)
      ..lineTo(0, size.height * .25)
      ..close();

    final angle = math.pi / 2;
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(angle);
    canvas.translate(-size.width / 2, -size.height / 2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
