import 'package:flutter/material.dart';

class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    Rect rect = Rect.fromLTRB(0, 0, width, height);
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    Gradient r1gradient =
        LinearGradient(colors: [Color(0xff3e35ad), Color(0xff051f55)]);
    paint..shader = r1gradient.createShader(rect);
    canvas.drawPath(mainBackground, paint);

    Path t1trianglePath = Path();

    t1trianglePath.moveTo(width, 0.4 * height);
    t1trianglePath.lineTo(0, height * 0.7);
    t1trianglePath.lineTo(0, height);
    t1trianglePath.lineTo(width, height);
    t1trianglePath.close();

    Gradient t1gradient =
        LinearGradient(colors: [Color(0xff33319b), Color(0xff33319b)]);

    paint..shader = t1gradient.createShader(rect);
    canvas.drawPath(t1trianglePath, paint);

    Path t2trianglePath = Path();

    t2trianglePath.moveTo(width, 0.48 * height);
    t2trianglePath.lineTo(width * 0.2, height);
    t2trianglePath.lineTo(0, height);
    t2trianglePath.lineTo(width, height);
    t2trianglePath.close();

    Gradient t2gradient =
        LinearGradient(colors: [Color(0xff192875), Color(0xff192875)]);

    paint..shader = t2gradient.createShader(rect);
    canvas.drawPath(t2trianglePath, paint);

    Path t3trianglePath = Path();

    t3trianglePath.moveTo(width, 0.52 * height);
    t3trianglePath.lineTo(width * 0.24, height);
    t3trianglePath.lineTo(0, height);
    t3trianglePath.lineTo(width, height);
    t3trianglePath.close();

    Gradient t3gradient =
        LinearGradient(colors: [Color(0xff192875), Color(0xff2c2f91)]);

    paint..shader = t3gradient.createShader(rect);
    canvas.drawPath(t3trianglePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
