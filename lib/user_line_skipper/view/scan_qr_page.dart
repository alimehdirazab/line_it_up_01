part of 'view.dart';

class ScanQrPage extends StatelessWidget {
  const ScanQrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanQrView();
  }
}

// class ScanQrView extends StatelessWidget {
//   const ScanQrView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class ScanQrView extends StatefulWidget {
  const ScanQrView({super.key});

  @override
  State<ScanQrView> createState() => _ScanQrViewState();
}

class _ScanQrViewState extends State<ScanQrView> {
  Barcode? result;
  MobileScannerController controller = MobileScannerController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    final barcode = capture.barcodes.first;
    setState(() {
      result = barcode;
    });

    controller.stop();
    final qrToken = barcode.rawValue;

    if (qrToken != null) {
      // do what you want with the qrToken
      context.pushPage(const LineSkipperPaymentPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MobileScanner(
          controller: controller,
          onDetect: (BarcodeCapture capture) => _onDetect(capture),
        ),
        Positioned(
          top: context.mHeight * 0.05,
          left: context.mWidth * 0.05,
          child: IconButton(
            icon: Icon(
              LineItUpIcons().backArrow,
              color: LineItUpColorTheme().white,
              size: 35,
            ),
            onPressed: () => context.popPage(),
          ),
        ),
      ],
    );
  }
}
