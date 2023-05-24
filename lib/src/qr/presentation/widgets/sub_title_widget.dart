part of '../../qr.dart';

class SubTitleWidget extends StatelessWidget {
  final String text;

  const SubTitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Pding.paddingL),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: safeGoogleFont(
            fontSize: 11, color: AppColors.grey, fontWeight: FontWeight.w400),
      ),
    );
  }
}
