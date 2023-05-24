part of '../qr.dart';

class MainScreen extends StatelessWidget {
  static const routeName = "/main";
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => sl<QRBloc>(),
          child: BlocConsumer<QRBloc, QRCodeState>(
            listener: (context, state) {
              if (state is QRCodeScanFailedState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
              if (state is ResultSavedState) {
                context.read<QRBloc>().add(GetResultsEvent());
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Pding.paddingL,
                            vertical: Pding.paddingXXL),
                        child: InkWell(
                          onTap: () => context.read<QRBloc>().add(
                              state is QRShowResultsState
                                  ? StartCameraScanningEvent()
                                  : GetResultsEvent()),
                          child: AnimatedSwitch(
                              isFadeTransition: true,
                              child: state is QRShowResultsState
                                  ? const AssetIcon(asset: AppAssets.back)
                                  : const AssetIcon(asset: AppAssets.menu)),
                        ),
                      ),
                    ),
                    AnimatedSwitch(
                        isFadeTransition: true,
                        child: state is QRShowResultsState
                            ? const TitleWidget(text: SText.resultScreenTitle)
                            : const TitleWidget(text: SText.scanScreenTitle)),
                    AnimatedSwitch(
                        isFadeTransition: true,
                        child: state is QRShowResultsState
                            ? const SubTitleWidget(text: SText.resultScreenPara)
                            : const SubTitleWidget(text: SText.scanScreenPara)),
                    const SizedBox(height: Pding.paddingL * 1.5),
                    AnimatedSwitch(
                      child: state is QRLoadingState
                          ? const AppLoader()
                          : state is QRShowResultsState
                              ? ResultsWidget(
                                  results: state.results,
                                )
                              : const ScanWidget(),
                    ),
                    if (state is! QRLoadingState)
                      EntranceFader(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Pding.paddingXXL,
                              vertical: Pding.paddingS),
                          child: ElevatedButton(
                            onPressed: () {
                              if (state is QRShowResultsState) {
                                if (state.results.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'No results to share, Scan first!')));
                                }
                                context
                                    .read<QRBloc>()
                                    .add(ShareResultsEvent(state.results));
                              }
                              if (state is InitialState) {
                                context.read<QRBloc>().add(ScanQRCodeEvent());
                              }
                            },
                            child: AnimatedSwitch(
                              isFadeTransition: true,
                              child: Text(
                                state is QRShowResultsState
                                    ? "Send"
                                    : "Place Camera Code",
                                style: safeGoogleFont(fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: Pding.paddingXXL * 2,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
