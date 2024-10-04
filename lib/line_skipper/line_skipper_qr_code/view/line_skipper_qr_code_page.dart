part of 'view.dart';

class LineSkipperQrCodePage extends StatelessWidget {
  const LineSkipperQrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LineSkipperQrCodeView();
  }
}

class LineSkipperQrCodeView extends StatelessWidget {
  const LineSkipperQrCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('QR Code',
              style: LineItUpTextTheme().body.copyWith(
                    color: LineItUpColorTheme().black,
                    fontSize: 16,
                  )),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(LineItUpImages.qrBackground),
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: PrettyQrView.data(
                        data: 'Ali Mehdi Raza',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Alex William',
                  style: LineItUpTextTheme()
                      .body
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Text(translate(context, 'scan_a_qr_code_to_get_my_info'),
                    style: LineItUpTextTheme().body.copyWith(
                          fontWeight: FontWeight.w400,
                        )),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleButton(
                      onPressed: () {},
                      icon: LineItUpIcons().share,
                      radius: 26,
                      backgroundColor: LineItUpColorTheme().grey20,
                      text: translate(context, 'share'),
                      textStyle: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    const SizedBox(width: 40),
                    CircleButton(
                      onPressed: () {},
                      icon: LineItUpIcons().scanner,
                      radius: 26,
                      backgroundColor: LineItUpColorTheme().grey20,
                      text: translate(context, 'scan_qr'),
                      textStyle: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
