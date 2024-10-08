part of 'view.dart';

class LineSkipperChangePaymentMethodPage extends StatelessWidget {
  final bool userProfile;
  const LineSkipperChangePaymentMethodPage(
      {super.key, this.userProfile = false});

  @override
  Widget build(BuildContext context) {
    return _LineSkipperChangePaymentMethodView(userProfile);
  }
}

class _LineSkipperChangePaymentMethodView extends StatelessWidget {
  final bool userProfile;
  const _LineSkipperChangePaymentMethodView(this.userProfile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate(context, 'select_payment_method'),
          style: LineItUpTextTheme().body.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        leading: IconButton(
            onPressed: () {
              if (userProfile) {
                context.pushPage(const RootPage());
              } else {
                context.pushPage(const LineSkipperRootPage());
              }
            },
            icon: Icon(LineItUpIcons().cross)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Column(
          children: [
            const Divider(),
            const SizedBox(height: 24),
            PaymentMethodTile(
              onTap: () {},
              paymetMehtodLogoUrl: LineItUpImages.cash,
              paymentMethodName: 'Cash',
              trailingIcon: true,
            ),
            const SizedBox(height: 16),
            PaymentMethodTile(
              onTap: () {
                context.pushPage(const LineSkipeprCardDetailsPage());
              },
              paymetMehtodLogoUrl: LineItUpImages.visa,
              paymentMethodName: 'Visa',
              trailingIcon: true,
              isPrimary: true,
            ),
            const SizedBox(height: 16),
            PaymentMethodTile(
              onTap: () {},
              paymetMehtodLogoUrl: LineItUpImages.masterCard,
              paymentMethodName: 'Master Card',
              trailingIcon: true,
            ),
            const SizedBox(height: 16),
            PaymentMethodTile(
              onTap: () {},
              paymetMehtodLogoUrl: LineItUpImages.paypal,
              paymentMethodName: 'PayPal',
              trailingIcon: true,
            ),
          ],
        ),
      ),
    );
  }
}
