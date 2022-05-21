import 'package:flutter/material.dart';

class DrawTriangleShape extends CustomPainter {
  late Paint painter;
  final Color color;

  DrawTriangleShape({required this.color}) {
    painter = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.height, size.width);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MyTriangle extends StatelessWidget {
  final Color color;
  final double size;

  const MyTriangle({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: DrawTriangleShape(color: color),
    );
  }
}
