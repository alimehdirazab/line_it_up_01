part of 'view.dart';

class LineSkipperWalletPage extends StatelessWidget {
  const LineSkipperWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LineSkipperWalletView();
  }
}

class LineSkipperWalletView extends StatelessWidget {
  const LineSkipperWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate(context, 'wallet'),
            style: LineItUpTextTheme().body.copyWith(
                  fontWeight: FontWeight.w600,
                )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 16, left: 10, right: 10),
              decoration: BoxDecoration(
                color: LineItUpColorTheme().grey20,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(translate(context, 'total_earning').toUpperCase(),
                          style: LineItUpTextTheme().body.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              )),
                      const SizedBox(height: 8),
                      Text('\$1,000.43',
                          style: LineItUpTextTheme().body.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              )),
                      const SizedBox(height: 16),
                    ],
                  ),
                  Image.asset(LineItUpImages.income),
                ],
              ),
            ),
            const SizedBox(height: 32),
            //Primary Payment Method
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(translate(context, 'primary_payment_method'),
                    style: LineItUpTextTheme().body.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                GestureDetector(
                  onTap: () {
                    context
                        .pushPage(const LineSkipperChangePaymentMethodPage());
                  },
                  child: Row(
                    children: [
                      Icon(
                        LineItUpIcons().currencyExchange,
                        color: LineItUpColorTheme().black,
                        size: 14,
                      ),
                      const SizedBox(width: 8),
                      Text(translate(context, 'change'),
                          style: LineItUpTextTheme().body.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              )),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            const PaymentMethodTile(
              paymetMehtodLogoUrl: LineItUpImages.visa,
              paymentMethodName: 'Visa',
              subtitle: '****7979',
              isPrimary: true,
            ),

            const SizedBox(height: 32),
            //Transaction History
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(translate(context, 'transaction_history'),
                    style: LineItUpTextTheme().body.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        LineItUpIcons().currencyExchange,
                        color: LineItUpColorTheme().black,
                        size: 14,
                      ),
                      const SizedBox(width: 8),
                      Text(translate(context, 'all_transactions'),
                          style: LineItUpTextTheme().body.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              )),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            const TransactionTile(
                paymetMehtodLogoUrl: LineItUpImages.visa,
                name: 'James Andrew',
                date: 'Aug 12',
                storeName: '“Food for Health”',
                transaction: 10.5),

            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            const TransactionTile(
                paymetMehtodLogoUrl: LineItUpImages.visa,
                name: 'James Andrew',
                date: 'Aug 12',
                storeName: '“Food for Health”',
                transaction: 10.5)
          ],
        ),
      ),
    );
  }
}
