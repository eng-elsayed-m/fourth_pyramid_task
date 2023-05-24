part of '../../qr.dart';

class ResultsWidget extends StatelessWidget {
  final List<ResultEntity> results;
  const ResultsWidget({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Pding.paddingXXL, right: Pding.paddingXXL),
      child: results.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(Pding.paddingL),
                child: Text(
                  "No Scanning history!",
                  style:
                      safeGoogleFont(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            )
          : ListView(
              shrinkWrap: true,
              children: results.map((e) => ResultItem(result: e.data)).toList(),
            ),
    );
  }
}
