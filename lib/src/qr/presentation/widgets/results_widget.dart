part of '../../qr.dart';

class ResultsWidget extends StatelessWidget {
  final List<ResultEntity> results;
  const ResultsWidget({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return results.isEmpty
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
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: Pding.paddingXXL),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: size.height * 0.45),
              child: ListView(
                shrinkWrap: true,
                children: results.reversed
                    .map((e) => ResultItem(result: e.data))
                    .toList(),
              ),
            ),
          );
  }
}
