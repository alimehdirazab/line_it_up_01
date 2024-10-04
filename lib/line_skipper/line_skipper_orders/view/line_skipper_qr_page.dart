part of 'view.dart';

class LineSkipperQrPage extends StatelessWidget {
  const LineSkipperQrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LineSkipperQrView();
  }
}

class LineSkipperQrView extends StatelessWidget {
  const LineSkipperQrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 76),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.pushPage(const LineSkipperOrderCompletedPage());
                },
                child: PrettyQrView.data(
                  data: 'Ali Mehdi Raza',
                ),
              ),
              const SizedBox(height: 16),
              Text(
                translate(
                    context, 'requester_will_scan_this_qr_code_to_pay_you'),
                style: LineItUpTextTheme().body.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
