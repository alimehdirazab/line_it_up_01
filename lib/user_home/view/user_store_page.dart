part of 'view.dart';

class UserStorePage extends StatelessWidget {
  const UserStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserHomeCubit(),
      child: const _UserStoreView(),
    );
  }
}

class _UserStoreView extends StatefulWidget {
  const _UserStoreView();

  @override
  State<_UserStoreView> createState() => _UserStoreViewState();
}

class _UserStoreViewState extends State<_UserStoreView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Listen for tab changes and update the cubit state
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        // Update the cubit with the selected tab index
        context.read<UserHomeCubit>().changeTab(
            _tabController.index == 0 ? TabOption.delivery : TabOption.pickup);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.popPage();
                      },
                      icon: Icon(
                        LineItUpIcons().backArrow,
                        color: LineItUpColorTheme().black,
                      ),
                    ),
                    Image.asset(LineItUpImages.store2),
                    CircleButton(
                      onPressed: () {
                        context.pushPage(const NotificationPage());
                      },
                      icon: LineItUpIcons().notification,
                      iconColor: LineItUpColorTheme().white,
                      backgroundColor: LineItUpColorTheme().grey,
                      radius: 20,
                    ),
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
            ),
          ),
          BlocBuilder<UserHomeCubit, UserHomeState>(
            builder: (context, state) {
              return TabBar(
                isScrollable: true,
                controller: _tabController,
                indicatorColor: LineItUpColorTheme().primary,
                labelColor: LineItUpColorTheme().primary,
                unselectedLabelColor: LineItUpColorTheme().black,
                dividerColor: LineItUpColorTheme().grey20,
                indicatorSize: TabBarIndicatorSize
                    .label, // Indicator takes space of content
                indicatorWeight: 4, // Indicator weight
                dividerHeight: 4,
                tabAlignment: TabAlignment.start,
                tabs: [
                  Tab(
                    child: Row(
                      children: [
                        Icon(LineItUpIcons().delivery),
                        const SizedBox(width: 5),
                        Text(translate(context, 'delivery')),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        Icon(LineItUpIcons().car),
                        const SizedBox(width: 5),
                        Text(translate(context, 'pickup')),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Fresh fruits',
                      style: LineItUpTextTheme().body.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ProductCard(
                            onTap: () {
                              context.pushPage(const UserProductDetailsPage());
                            },
                            productImage: LineItUpImages.blackPlums,
                            $price: '1',
                            $productName: 'Black Plums',
                            productId: 1,
                          ),
                          const SizedBox(width: 8),
                          const ProductCard(
                            productImage: LineItUpImages.peach,
                            $price: '1',
                            $productName: 'Peach',
                            productId: 2,
                          ),
                          const SizedBox(width: 8),
                          const ProductCard(
                            productImage: LineItUpImages.apple,
                            $price: '1',
                            $productName: 'Apple',
                            productId: 3,
                          ),
                          const SizedBox(width: 8),
                          const ProductCard(
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
                    const SizedBox(height: 24),
                    Text(
                      'Frozen snacks',
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
                            productImage: LineItUpImages.farmRich,
                            $price: '9.19',
                            $productName:
                                'Farm Rich Mozzarella Sticks, Breaded',
                            weight: '22 oz',
                            productId: 8,
                          ),
                          SizedBox(width: 8),
                          ProductCard(
                            productImage: LineItUpImages.wegmans,
                            $price: '6.99',
                            $productName: 'Wegmans Crinkle Cut Potatos ',
                            weight: '32 oz',
                            productId: 9,
                          ),
                          SizedBox(width: 8),
                          ProductCard(
                            productImage: LineItUpImages.feelFood,
                            $price: '5.99',
                            $productName:
                                'Feel Good Food Mac & Cheese, Bites Three Cheese',
                            weight: '8 oz',
                            productId: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: BlocBuilder<UserHomeCubit, UserHomeState>(
        buildWhen: (previous, current) =>
            previous.cartItems != current.cartItems,
        builder: (context, state) {
          // Calculate total cart item count
          final totalCartCount = state.cartItems.values
              .fold(0, (sum, itemCount) => sum + itemCount);

          return CustomElevatedButton(
            width: context.mWidth * 0.43,
            hasIcon: true,
            icon: LineItUpIcons().cart,
            title:
                '$totalCartCount  ${translate(context, 'view_cart')}', // Display total count
            onTap: () {
              //context.pushPage(const UserCartPage());
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
