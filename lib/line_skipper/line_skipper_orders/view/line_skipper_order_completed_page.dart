part of 'view.dart';

class LineSkipperOrderCompletedPage extends StatelessWidget {
  const LineSkipperOrderCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LineSkipperOrderCompletedView();
  }
}

class LineSkipperOrderCompletedView extends StatelessWidget {
  const LineSkipperOrderCompletedView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    context.pushAndRemoveUntilPage(const LineSkipperRootPage());
                  },
                  child: Text(
                    'Done',
                    style: LineItUpTextTheme()
                        .body
                        .copyWith(color: LineItUpColorTheme().primary),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: context.mHeight * 0.25),
          Column(
            children: [
              Image.asset(LineItUpImages.checkVerified),
              const SizedBox(height: 12),
              Text(
                translate(context, 'order_completed_successfully'),
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 16),
              Text(translate(context, 'you_have_earned'),
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      )),
              const SizedBox(height: 8),
              Text(
                '\$15.5',
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
