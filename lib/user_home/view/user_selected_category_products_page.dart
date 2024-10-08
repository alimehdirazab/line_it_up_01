part of 'view.dart';

class UserSelectedCategoryProductsPage extends StatelessWidget {
  const UserSelectedCategoryProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserHomeCubit(),
      child: const _UserSelectedCategoryProductsView(),
    );
  }
}

class _UserSelectedCategoryProductsView extends StatefulWidget {
  const _UserSelectedCategoryProductsView();

  @override
  State<_UserSelectedCategoryProductsView> createState() =>
      _UserSelectedCategoryProductsViewState();
}

class _UserSelectedCategoryProductsViewState
    extends State<_UserSelectedCategoryProductsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Listen for tab changes and update the cubit state
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        // Update the cubit with the selected tab index
        context.read<UserHomeCubit>().changeCategory(_tabController.index == 0
            ? Category.dairyProducts
            : _tabController.index == 1
                ? Category.meatSeafood
                : Category.beverages);
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                tabs: const [
                  Tab(
                    child: Text('Dairy Products'),
                  ),
                  Tab(
                    child: Text('Meat & Seafood'),
                  ),
                  Tab(
                    child: Text('Beverages'),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 24),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Chip(label: Text('Eggs')),
                  SizedBox(width: 8),
                  Chip(label: Text('Milk')),
                  SizedBox(width: 8),
                  Chip(label: Text('Yogurt')),
                  SizedBox(width: 8),
                  Chip(label: Text('Cheese')),
                  SizedBox(width: 8),
                  Chip(label: Text('Butter')),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Eggs',
                      style: LineItUpTextTheme().body.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        ProductCard(
                          onTap: () {},
                          productImage: LineItUpImages.egg30,
                          $price: '1',
                          $productName: 'Egg tray of 30',
                          productId: 11,
                          width: context.mWidth * 0.45,
                          height: 260,
                          imageWidth: 150,
                          imageHeight: 125,
                        ),
                        const SizedBox(width: 8),
                        ProductCard(
                          productImage: LineItUpImages.egg10,
                          $price: '4',
                          $productName: 'Egg tray of 10 ',
                          productId: 22,
                          width: context.mWidth * 0.45,
                          height: 260,
                          imageWidth: 150,
                          imageHeight: 125,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Milk',
                      style: LineItUpTextTheme().body.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        ProductCard(
                          onTap: () {},
                          productImage: LineItUpImages.cowMilk,
                          $price: '15',
                          $productName: 'EWG’s whole cow milk',
                          productId: 22,
                          width: context.mWidth * 0.45,
                          height: 260,
                          imageWidth: 150,
                          imageHeight: 125,
                        ),
                        const SizedBox(width: 8),
                        ProductCard(
                          productImage: LineItUpImages.organicMilk,
                          $price: '10',
                          $productName: 'Organic milk',
                          productId: 44,
                          width: context.mWidth * 0.45,
                          height: 260,
                          imageWidth: 150,
                          imageHeight: 125,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        ProductCard(
                          onTap: () {},
                          productImage: LineItUpImages.cowMilk,
                          $price: '15',
                          $productName: 'EWG’s whole cow milk',
                          productId: 55,
                          width: context.mWidth * 0.45,
                          height: 260,
                          imageWidth: 150,
                          imageHeight: 125,
                        ),
                        const SizedBox(width: 8),
                        ProductCard(
                          productImage: LineItUpImages.organicMilk,
                          $price: '10',
                          $productName: 'Organic milk',
                          productId: 66,
                          width: context.mWidth * 0.45,
                          height: 260,
                          imageWidth: 150,
                          imageHeight: 125,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Yogurt',
                      style: LineItUpTextTheme().body.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        ProductCard(
                          onTap: () {},
                          productImage: LineItUpImages.yogurt1,
                          $price: '1',
                          $productName: 'Wegmans Greek Plain Nonfat Yogurt',
                          weight: '32 oz',
                          productId: 77,
                          width: context.mWidth * 0.45,
                          height: 260,
                          imageWidth: 150,
                          imageHeight: 125,
                        ),
                        const SizedBox(width: 8),
                        ProductCard(
                          productImage: LineItUpImages.yogurt2,
                          $price: '4',
                          $productName:
                              'Yoplait Oui Yogurt, French Style, Whole',
                          weight: '5 oz',
                          productId: 88,
                          width: context.mWidth * 0.45,
                          height: 260,
                          imageWidth: 150,
                          imageHeight: 125,
                        ),
                      ],
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
