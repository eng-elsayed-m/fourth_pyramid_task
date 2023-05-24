part of "../../login.dart";

class LoginPaint extends StatelessWidget {
  const LoginPaint({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: FramePainter(),
      child: const SizedBox(
        width: double.infinity,
        height: 500,
      ),
    );
  }
}

class FramePainter extends CustomPainter {
  static const orangeWithpacityColor = Color(0x39FF7D55);
  @override
  void paint(Canvas canvas, Size size) {
    //appearance
    final paint = Paint()
      ..color = orangeWithpacityColor
      ..style = PaintingStyle.fill;
    final paintSmall = Paint()
      ..color = orangeWithpacityColor
      ..style = PaintingStyle.fill;

    // prop
    final radius = size.width / 2;
    final center = Offset(size.width / 2.2, -size.height * 0.05);
    final radiusSmall = size.width / 2.4;
    final centerSmall = Offset(size.width * 0.87, -size.height * 0.05);

    //shapes
    final path = Path()
      ..moveTo(center.dx, center.dy)
      ..arcTo(
        Rect.fromCircle(center: center, radius: radius),
        0,
        3.14,
        false,
      );
    final pathSmall = Path()
      ..moveTo(center.dx, center.dy)
      ..arcTo(
        Rect.fromCircle(center: centerSmall, radius: radiusSmall),
        0,
        3.14,
        false,
      );
    //drawers
    canvas.drawPath(pathSmall, paintSmall);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
