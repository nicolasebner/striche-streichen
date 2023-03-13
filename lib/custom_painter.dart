import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  List points = [];

  MyCustomPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paintStroke = Paint()..strokeWidth = 10;
    Paint paint = Paint()..strokeWidth = 5;

    height(line) {
      const spaceHeight = 0.05;
      const lineHeight = 0.14;
      var start = spaceHeight * line + lineHeight * (line - 1);
      return [start, start + lineHeight];
    }

    var linesStartEnd = [
      [12 / 6, ...height(1)],
      [12 / 5, ...height(2)],
      [12 / 7, ...height(2)],
      [12 / 4, ...height(3)],
      [12 / 6, ...height(3)],
      [12 / 8, ...height(3)],
      [12 / 3, ...height(4)],
      [12 / 5, ...height(4)],
      [12 / 7, ...height(4)],
      [12 / 9, ...height(4)],
      [12 / 2, ...height(5)],
      [12 / 4, ...height(5)],
      [12 / 6, ...height(5)],
      [12 / 8, ...height(5)],
      [12 / 10, ...height(5)],
    ];

    for (var line in linesStartEnd) {
      Offset startPoint = Offset(size.width / line[0], size.height * line[1]);
      Offset endPoint = Offset(size.width / line[0], size.height * line[2]);
      canvas.drawLine(startPoint, endPoint, paintStroke);
    }

    for (int x = 0; x < points.length - 1; x++) {
      if (points[x] != null && points[x + 1] != null) {
        canvas.drawLine(points[x], points[x + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // throw UnimplementedError();
    return true;
  }
}
