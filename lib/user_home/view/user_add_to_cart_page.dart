part of 'view.dart';

class UserAddToCartPage extends StatelessWidget {
  const UserAddToCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserHomeCubit(),
      child: const _UserAddToCartView(),
    );
  }
}

class _UserAddToCartView extends StatelessWidget {
  const _UserAddToCartView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate(context, 'add_to_cart'),
          style: LineItUpTextTheme().body,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.popPage();
          },
          icon: Icon(LineItUpIcons().backArrow),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 24),
            AddToCartCard(
              imageHeader: LineItUpImages.store2,
              imageMain: LineItUpImages.blackPlums,
              title: "Black Pulms",
              description: "About 0.2 lb each",
              estimatedCost: "3.49 / lb",
              cost: "1",
              showDivider: false,
            ),
          ],
        ),
      ),
    );
  }
}
