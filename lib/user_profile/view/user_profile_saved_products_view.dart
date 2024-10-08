part of 'view.dart';

class UserProfileSavedProductsPage extends StatelessWidget {
  const UserProfileSavedProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserProfileSavedProductsView();
  }
}

class UserProfileSavedProductsView extends StatelessWidget {
  const UserProfileSavedProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate(context, 'saved_products'),
          style: LineItUpTextTheme().body.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.0),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            CustomSavedProductWidget(
              imageHeader: LineItUpImages.store2,
              imageMain: LineItUpImages.blackPlums,
              title: "Black Pulms",
              description: "About 0.2 lb each",
              estimatedCost: "3.49 / lb",
              cost: "1",
              showDivider: true,
            ),
            SizedBox(
              height: 16,
            ),
            CustomSavedProductWidget(
              imageHeader: LineItUpImages.store2,
              imageMain: LineItUpImages.peach,
              title: "Black Pulms",
              description: "About 0.2 lb each",
              estimatedCost: "3.49 / lb",
              cost: "1",
              showDivider: false,
            )
          ],
        ),
      ),
    );
  }
}
