part of 'view.dart';

class UserStoresByCategoryPage extends StatelessWidget {
  const UserStoresByCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _UserStoresByCategoryView();
  }
}

class _UserStoresByCategoryView extends StatelessWidget {
  const _UserStoresByCategoryView();
  @override
  Widget build(BuildContext context) {
    // BlocBuilder can now access the LineSkipperCubit
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate(context, 'line_skipper'),
          style: LineItUpTextTheme().body,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: context.mWidth * 0.04),
            child: CircleAvatar(
              backgroundColor: LineItUpColorTheme().grey,
              child: IconButton(
                icon: Icon(
                  LineItUpIcons().notification,
                  color: LineItUpColorTheme().white,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 12),
        child: Column(
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CategoryCard(
                            onTap: () {},
                            categoryText: 'Grocery',
                            categoryImage: LineItUpImages.grocery,
                            isSelected: true,
                          ),
                          CategoryCard(
                            onTap: () {},
                            categoryText: 'Fast Food',
                            categoryImage: LineItUpImages.fastFood,
                          ),
                          CategoryCard(
                            onTap: () {},
                            categoryText: 'Coffee',
                            categoryImage: LineItUpImages.coffee,
                          ),
                          CategoryCard(
                            onTap: () {},
                            categoryText: 'Pizza',
                            categoryImage: LineItUpImages.pizza,
                          ),
                          CategoryCard(
                            onTap: () {},
                            categoryText: 'Chinese',
                            categoryImage: LineItUpImages.chinese,
                          ),
                          CategoryCard(
                            onTap: () {},
                            categoryText: 'Tacos',
                            categoryImage: LineItUpImages.tacos,
                          ),
                          CategoryCard(
                            onTap: () {},
                            categoryText: 'Thai',
                            categoryImage: LineItUpImages.thai,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    StroreCard(
                      onTap: () {
                        context.pushPage(const UserStorePage());
                      },
                      image: LineItUpImages.store2,
                      name: 'Food for Health',
                      distance: '2.3 mi',
                      showDeliveryTime: true,
                      deliveryTime: 'Delivery by 7:59pm',
                      showDeliveryFee: true,
                      deliveryFee: '\$5 delivery',
                    ),
                    const SizedBox(height: 20),
                    const StroreCard(
                      image: LineItUpImages.store1,
                      name: 'Cost Less Food Company',
                      distance: '2.3 mi',
                      isClosed: true,
                      showDotSepreator: false,
                    ),
                    const SizedBox(height: 20),
                    const StroreCard(
                      image: LineItUpImages.store3,
                      name: 'Bristol Farms',
                      distance: '2.3 mi',
                      showDeliveryTime: true,
                      deliveryTime: 'Delivery by 7:59pm',
                      showDeliveryFee: true,
                      deliveryFee: '\$5 delivery',
                      isDeliveryFree: true,
                    ),
                    const SizedBox(height: 20),
                    const StroreCard(
                      image: LineItUpImages.store4,
                      name: 'Pavilions',
                      distance: '2.3 mi',
                      showDeliveryTime: true,
                      deliveryTime: 'Delivery by 7:59pm',
                      showDeliveryFee: true,
                      deliveryFee: '\$5 delivery',
                    ),
                    const SizedBox(height: 20),
                    const StroreCard(
                      image: LineItUpImages.store5,
                      name: 'Food for Health',
                      distance: '2.3 mi',
                      showDeliveryTime: true,
                      deliveryTime: 'Delivery by 7:59pm',
                      showDeliveryFee: true,
                      deliveryFee: '\$5 delivery',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
