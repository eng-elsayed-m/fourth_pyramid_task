part of '../../qr.dart';

class ScanWidget extends StatefulWidget {
  const ScanWidget({super.key});

  @override
  State<ScanWidget> createState() => _ScanWidgetState();
}

class _ScanWidgetState extends State<ScanWidget> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        result = scanData;
        context.read<QRBloc>().add(SaveResultsEvent(result!.code!));
      }
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: size.width * 0.5,
          height: size.width * 0.5,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  overlayColor: Theme.of(context).scaffoldBackgroundColor,
                  cutOutSize: size.width * 0.45,
                ),
              ),
              Image.asset(
                AppAssets.frame,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
        if (result != null)
          Text(
              'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Pding.paddingM),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Scanning code',
                  style: safeGoogleFont(fontSize: 15),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                  child: Image.asset(
                    AppAssets.dotsLoader,
                    height: 5,
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: Pding.paddingL),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Pding.paddingS),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(Pding.paddingS),
                child: InkWell(
                    onTap: () {},
                    child: const Icon(Icons.photo_library_outlined)),
              ),
              Padding(
                padding: const EdgeInsets.all(Pding.paddingS),
                child:
                    InkWell(onTap: () {}, child: const Icon(Icons.blur_linear)),
              ),
              Padding(
                padding: const EdgeInsets.all(Pding.paddingS),
                child: InkWell(
                    onTap: () async {
                      await controller?.toggleFlash();
                      setState(() {});
                    },
                    child: FutureBuilder(
                      future: controller?.getFlashStatus(),
                      builder: (context, snapshot) {
                        return Icon(
                          Icons.flash_on,
                          color: snapshot.data ?? false
                              ? Theme.of(context).primaryColor
                              : null,
                        );
                      },
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
