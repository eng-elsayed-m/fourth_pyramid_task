part of '../../qr.dart';

class ResultItem extends StatelessWidget {
  final String result;
  const ResultItem({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: Pding.paddingXL,
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: TextFormField(
            initialValue: result,
            maxLines: 3,
          ),
        ),
      ),
      leading: const AssetIcon(
        asset: AppAssets.result,
        size: Pding.paddingXL * 1.5,
      ),
      minLeadingWidth: Pding.paddingXXL,
      title: Text(result,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: safeGoogleFont(fontSize: 18, fontWeight: FontWeight.normal)),
    );
  }
}
