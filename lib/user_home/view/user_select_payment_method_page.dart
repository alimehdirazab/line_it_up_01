part of 'view.dart';

class UserSelectPaymentMethodPage extends StatelessWidget {
  const UserSelectPaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _UserSelectPaymentMethodView();
  }
}

class _UserSelectPaymentMethodView extends StatelessWidget {
  const _UserSelectPaymentMethodView();

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
              context.popPage();
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
              onTap: () {},
              paymetMehtodLogoUrl: LineItUpImages.visa,
              paymentMethodName: 'Visa',
              trailingIcon: true,
            ),
            const SizedBox(height: 16),
            PaymentMethodTile(
              onTap: () {
                context.pushPage(const UserAddCardDetailsPage());
              },
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
