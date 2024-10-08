part of 'view.dart';

class UserBrowsePage extends StatelessWidget {
  const UserBrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _UserBrowseView();
  }
}

class _UserBrowseView extends StatelessWidget {
  const _UserBrowseView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 18, right: 18, top: 50),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      LineItUpColorTheme().gradient1,
                      LineItUpColorTheme().gradient2
                    ]),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Browse',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.pushPage(const UserAddToCartPage());
                            },
                            child: Badge(
                              label: Text(
                                '2',
                                style: LineItUpTextTheme().body.copyWith(
                                    color: LineItUpColorTheme().white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              backgroundColor: LineItUpColorTheme().primary,
                              child: Icon(
                                LineItUpIcons().cart1,
                                color: LineItUpColorTheme().black,
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          GestureDetector(
                            onTap: () {
                              context.pushPage(const NotificationPage());
                            },
                            child: Badge(
                              label: Text(
                                '1',
                                style: LineItUpTextTheme().body.copyWith(
                                    color: LineItUpColorTheme().white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              backgroundColor: LineItUpColorTheme().primary,
                              child: Icon(
                                LineItUpIcons().notification,
                                color: LineItUpColorTheme().black,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    onTap: () {
                      context.pushPage(const UserSearchPage());
                    },
                    readOnly: true,
                    hintText: 'Search mart, product & foods',
                    fillColor: LineItUpColorTheme().white,
                    prefixIcon: Icon(
                      LineItUpIcons().search,
                      color: LineItUpColorTheme().grey,
                      size: 24,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: LineItUpColorTheme().black.withOpacity(0.25),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: LineItUpColorTheme().black.withOpacity(0.25),
                      ),
                    ),
                  ),
                ],
              )),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      style: LineItUpTextTheme()
                          .body
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 6),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ShopCategoryCard(
                            onTap: () {
                              context.pushPage(
                                  const UserSelectedCategoryProductsPage());
                            },
                            categoryText: 'Dairy Products',
                            categoryImage: LineItUpImages.dairy,
                            isSelected: true,
                          ),
                          const SizedBox(width: 8),
                          const ShopCategoryCard(
                            categoryText: 'Meat & Seafood',
                            categoryImage: LineItUpImages.proteins,
                            isSelected: true,
                          ),
                          const SizedBox(width: 8),
                          const ShopCategoryCard(
                            categoryText: 'Beverages',
                            categoryImage: LineItUpImages.softDrinks,
                            isSelected: true,
                          ),
                          const SizedBox(width: 8),
                          const ShopCategoryCard(
                            categoryText: 'Bakery & Breakfast',
                            categoryImage: LineItUpImages.bread,
                            isSelected: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ShopCategoryCard(
                            onTap: () {},
                            categoryText: 'Everyday Grocery',
                            categoryImage: LineItUpImages.basket,
                            isSelected: true,
                          ),
                          const SizedBox(width: 8),
                          const ShopCategoryCard(
                            categoryText: 'Cooking Oil',
                            categoryImage: LineItUpImages.oil,
                            isSelected: true,
                          ),
                          const SizedBox(width: 8),
                          const ShopCategoryCard(
                            categoryText: 'Noodles & Pasta',
                            categoryImage: LineItUpImages.food,
                            isSelected: true,
                          ),
                          const SizedBox(width: 8),
                          const ShopCategoryCard(
                            categoryText: 'Spices & Dressings',
                            categoryImage: LineItUpImages.spice,
                            isSelected: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ShopCategoryCard(
                            onTap: () {},
                            categoryText: 'Tea & Coffee',
                            categoryImage: LineItUpImages.hotCup,
                            isSelected: true,
                          ),
                          const SizedBox(width: 8),
                          const ShopCategoryCard(
                            categoryText: 'Snacks',
                            categoryImage: LineItUpImages.candies,
                            isSelected: true,
                          ),
                          const SizedBox(width: 8),
                          const ShopCategoryCard(
                            categoryText: 'Chocolate & Dessert',
                            categoryImage: LineItUpImages.chocolateCake,
                            isSelected: true,
                          ),
                          const SizedBox(width: 8),
                          const ShopCategoryCard(
                            categoryText: 'Personal Care',
                            categoryImage: LineItUpImages.personalCare,
                            isSelected: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(translate(context, 'stores_near_you'),
                        style: LineItUpTextTheme().body.copyWith(
                              fontWeight: FontWeight.w600,
                            )),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CircleStoreCard(
                            onTap: () {},
                            image: LineItUpImages.store1,
                            name: 'Cost Less Food Company',
                            time: '01:30pm',
                            isClosed: true,
                          ),
                          const SizedBox(width: 16),
                          CircleStoreCard(
                            onTap: () {
                              context.pushPage(const UserStorePage());
                            },
                            image: LineItUpImages.store2,
                            name: 'Food for Health',
                            time: '01:30pm',
                          ),
                          const SizedBox(width: 16),
                          CircleStoreCard(
                            onTap: () {},
                            image: LineItUpImages.store3,
                            name: 'Bristol Farms',
                            time: '01:30pm',
                          ),
                          const SizedBox(width: 16),
                          CircleStoreCard(
                            onTap: () {},
                            image: LineItUpImages.store4,
                            name: 'Pavilions',
                            time: '01:30pm',
                            isClosed: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text('Foods Near You',
                        style: LineItUpTextTheme().body.copyWith(
                              fontWeight: FontWeight.w600,
                            )),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _foodNearYouCard(
                            context, LineItUpImages.fastFoodItem, 'Fast Food'),
                        _foodNearYouCard(
                            context, LineItUpImages.pizzaItem, 'Pizza'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _foodNearYouCard(
                            context, LineItUpImages.chineseFood, 'Chinese'),
                        _foodNearYouCard(
                            context, LineItUpImages.indian, 'Indian'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _foodNearYouCard(
                            context, LineItUpImages.mexican, 'Maxican'),
                        _foodNearYouCard(
                            context, LineItUpImages.sushi, 'Sushi'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _foodNearYouCard(
                            context, LineItUpImages.healthy, 'Healthy'),
                        _foodNearYouCard(
                            context, LineItUpImages.thaiItem, 'Thai'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _foodNearYouCard(BuildContext context, String image, String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            image,
            width: context.mWidth * 0.44,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: LineItUpTextTheme()
              .body
              .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
