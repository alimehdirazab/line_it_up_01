part of 'view.dart';

class UserProductDetailsPage extends StatelessWidget {
  const UserProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserHomeCubit(),
      child: const _UserProductDetailsView(),
    );
  }
}

class _UserProductDetailsView extends StatelessWidget {
  const _UserProductDetailsView();

  @override
  Widget build(BuildContext context) {
    int productId = 111;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: context.mHeight * 0.3,
            decoration: BoxDecoration(
              color: LineItUpColorTheme().grey20,
            ),
            child: Stack(
              children: [
                Center(child: Image.asset(LineItUpImages.blackPlums)),
                Positioned(
                  top: 48,
                  left: 16,
                  child: IconButton(
                    onPressed: () {
                      context.popPage();
                    },
                    icon: Icon(
                      LineItUpIcons().backArrow,
                      color: LineItUpColorTheme().black,
                      size: 32,
                    ),
                  ),
                ),
                Positioned(
                  top: 48,
                  right: 16,
                  child: CircleButton(
                    onPressed: () {
                      context.pushPage(const NotificationPage());
                    },
                    icon: LineItUpIcons().notification,
                    iconColor: LineItUpColorTheme().white,
                    backgroundColor: LineItUpColorTheme().grey,
                    radius: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Black Plums',
                              style: LineItUpTextTheme().heading.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Icon(
                              LineItUpIcons().heart,
                              color: LineItUpColorTheme().black,
                              size: 24,
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'About 0.2 lb each . \$3.49 / lb',
                          style: LineItUpTextTheme().body.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: LineItUpColorTheme().grey,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '\$1',
                          style: LineItUpTextTheme().heading.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 16),
                        Text(translate(context, 'product_information'),
                            style: LineItUpTextTheme().heading.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                )),
                        const SizedBox(height: 8),
                        Text(
                          'Black plums are a good source of vitamins A and C, as well as fiber. They also contain antioxidants that help reduce inflammation and protect your cells from damage. Black plums are a good source of vitamins A and C, as well as fiber. They also contain antioxidants that help reduce inflammation and protect your cells from damage.',
                          style: LineItUpTextTheme().body.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: LineItUpColorTheme().grey,
                              ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(translate(context, 'related_products'),
                            style: LineItUpTextTheme().heading.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                )),
                        const SizedBox(height: 8),
                        const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ProductCard(
                                productImage: LineItUpImages.blackPlums,
                                $price: '1',
                                $productName: 'Black Plums',
                                productId: 1,
                              ),
                              SizedBox(width: 8),
                              ProductCard(
                                productImage: LineItUpImages.peach,
                                $price: '1',
                                $productName: 'Peach',
                                productId: 2,
                              ),
                              SizedBox(width: 8),
                              ProductCard(
                                productImage: LineItUpImages.apple,
                                $price: '1',
                                $productName: 'Apple',
                                productId: 3,
                              ),
                              SizedBox(width: 8),
                              ProductCard(
                                productImage: LineItUpImages.banana,
                                $price: '1',
                                $productName: 'Banana',
                                productId: 4,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Breakfast',
                          style: LineItUpTextTheme().body.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        const SizedBox(height: 8),
                        const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ProductCard(
                                productImage: LineItUpImages.generalMillsGolden,
                                $price: '6.99',
                                $productName:
                                    'General Mills Golden Grahams Cereal, Retro',
                                weight: '12 oz',
                                productId: 5,
                              ),
                              SizedBox(width: 8),
                              ProductCard(
                                productImage: LineItUpImages.trixCornPuff,
                                $price: '6.99',
                                $productName: 'Trix Corn Puff, 6 Fruity Shapes',
                                weight: '10 oz',
                                productId: 6,
                              ),
                              SizedBox(width: 8),
                              ProductCard(
                                productImage: LineItUpImages.cheerios,
                                $price: '5.99',
                                $productName:
                                    'Cheerios Cereal, Gluten Free, Large Size',
                                weight: '12 oz',
                                productId: 7,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<UserHomeCubit, UserHomeState>(
                buildWhen: (previous, current) =>
                    previous.cartItems != current.cartItems,
                builder: (context, state) {
                  // Get the cart count for the specific product
                  final cartCount = state.cartItems[productId] ?? 0;

                  return Container(
                    width: context.mWidth * 0.4,
                    height: 44,
                    decoration: BoxDecoration(
                      color: LineItUpColorTheme().grey20,
                      borderRadius: BorderRadius.circular(54),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<UserHomeCubit>()
                                .updateCartItemCount(productId, cartCount - 1);
                          },
                          child: Icon(
                            LineItUpIcons().delete1,
                            size: 20,
                            color: LineItUpColorTheme().black,
                          ),
                        ),
                        Text(
                          cartCount.toString(),
                          style: LineItUpTextTheme().body.copyWith(
                                color: LineItUpColorTheme().black,
                              ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<UserHomeCubit>()
                                .updateCartItemCount(productId, cartCount + 1);
                          },
                          child: Icon(
                            LineItUpIcons().add,
                            size: 20,
                            color: LineItUpColorTheme().black,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            CustomElevatedButton(
              width: context.mWidth * 0.4,
              title: 'View Cart',
              onTap: () {
                context.pushPage(const UserCartPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
