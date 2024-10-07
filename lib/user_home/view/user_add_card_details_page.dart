part of 'view.dart';

class UserAddCardDetailsPage extends StatelessWidget {
  const UserAddCardDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _UserAddCardDetailsView();
  }
}

class _UserAddCardDetailsView extends StatefulWidget {
  const _UserAddCardDetailsView();

  @override
  State<_UserAddCardDetailsView> createState() =>
      _UserAddCardDetailsViewState();
}

class _UserAddCardDetailsViewState extends State<_UserAddCardDetailsView> {
  CardFormEditController? controller = CardFormEditController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate(context, 'add_card_details'),
          style: LineItUpTextTheme().body.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
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
            CardFormField(
              controller: controller,
              style: CardFormStyle(
                backgroundColor: LineItUpColorTheme().white,
                textColor: LineItUpColorTheme().black,
                placeholderColor: LineItUpColorTheme().grey,
                cursorColor: LineItUpColorTheme().black,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                title: translate(context, 'add_card'),
                onTap: () {
                  context.pushPage(const UserAddressAndPaymentPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
