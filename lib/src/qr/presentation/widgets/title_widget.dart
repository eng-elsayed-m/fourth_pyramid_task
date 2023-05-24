part of '../../qr.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  const TitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      text,
      style: safeGoogleFont(fontSize: 18, fontWeight: FontWeight.w800),
    ));
  }
}
