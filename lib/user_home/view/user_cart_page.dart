part of 'view.dart';

class UserCartPage extends StatelessWidget {
  const UserCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserHomeCubit(),
      child: const _UserCartView(),
    );
  }
}

class _UserCartView extends StatefulWidget {
  const _UserCartView();

  @override
  State<_UserCartView> createState() => _UserCartViewState();
}

class _UserCartViewState extends State<_UserCartView>
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
        children: [
          const SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      context.popPage();
                    },
                    icon: Icon(
                      LineItUpIcons().backArrow,
                      size: 32,
                      color: LineItUpColorTheme().black,
                    )),
                CircleButton(
                  onPressed: () {
                    context.pushPage(const UserSearchPage());
                  },
                  icon: LineItUpIcons().notification,
                  radius: 22,
                  backgroundColor: LineItUpColorTheme().grey,
                  iconColor: LineItUpColorTheme().white,
                )
              ],
            ),
          ),
          // Using BlocBuilder to listen for tab changes from the cubit
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cart',
                              style: LineItUpTextTheme()
                                  .body
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text('\$1.7',
                                style: LineItUpTextTheme().body.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    )),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Icon(LineItUpIcons().flash),
                            const SizedBox(width: 4),
                            Text('Delivery by 7:59pm',
                                style: LineItUpTextTheme().body.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: LineItUpColorTheme().primary,
                                    )),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text('Food for health . California',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: LineItUpColorTheme().grey,
                                )),
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 16),
                        const CartProductTile(
                          productImage: LineItUpImages.blackPlums,
                          productName: 'Black Plums',
                          productPrice: '1.7',
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(
                              LineItUpIcons().add,
                              color: LineItUpColorTheme().black,
                            ),
                            const SizedBox(width: 8),
                            Text('Add more items',
                                style: LineItUpTextTheme().body.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 24),
                        Text(
                          'Hot products',
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
                                  context
                                      .pushPage(const UserProductDetailsPage());
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
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                              style: LineItUpTextTheme().body.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            Text('\$1.7',
                                style: LineItUpTextTheme().body.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    )),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery charges',
                              style: LineItUpTextTheme().body.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            Text('\$0.77',
                                style: LineItUpTextTheme().body.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    )),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Packaging fee',
                              style: LineItUpTextTheme().body.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            Text('\$0.11',
                                style: LineItUpTextTheme().body.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    )),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text('\$2.58',
                    style: LineItUpTextTheme().body.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        )),
              ],
            ),
            const SizedBox(height: 24),
            CustomElevatedButton(
                width: double.infinity,
                title: 'Confirm payment & address',
                onTap: () {})
          ],
        ),
      ),
    );
  }
}
