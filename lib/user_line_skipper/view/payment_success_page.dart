part of 'view.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PaymentSuccessView();
  }
}

class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.mHeight * 0.05,
          horizontal: 16,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    context.pushAndRemoveUntilPage(const RootPage());
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
            SizedBox(height: context.mHeight * 0.1),
            Image.asset(LineItUpImages.checkVerified),
            const SizedBox(height: 16),
            Text(
              'Payment Successful',
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              '\$15.5',
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: LineItUpColorTheme().grey20,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  _buildTextData(context, 'to', 'Sam Karen'),
                  const SizedBox(height: 12),
                  _buildTextData(context, 'queue_time', '10:05 min'),
                  const SizedBox(height: 12),
                  _buildTextData(context, 'order_id', '12345849'),
                  const SizedBox(height: 12),
                  _buildTextData(context, 'payment_method', 'Master Card'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextData(BuildContext context, String title, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          translate(context, title),
          style: LineItUpTextTheme().body.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: LineItUpColorTheme().grey,
              ),
        ),
        Text(
          data,
          style: LineItUpTextTheme().body.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
