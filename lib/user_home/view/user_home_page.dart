part of 'view.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserHomeCubit(),
      child: const _UserHomeView(),
    );
  }
}

class _UserHomeView extends StatefulWidget {
  const _UserHomeView();

  @override
  State<_UserHomeView> createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<_UserHomeView>
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Deliver At',
                              style: LineItUpTextTheme().body.copyWith(
                                    color: LineItUpColorTheme().grey,
                                    fontSize: 12,
                                  )),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return const _DelverTOBottomSheet();
                                },
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('12348 street, LA',
                                    style: LineItUpTextTheme().body.copyWith(
                                          fontWeight: FontWeight.w600,
                                        )),
                                Icon(
                                  LineItUpIcons().downArrow,
                                  size: 24,
                                  color: LineItUpColorTheme().black,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
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
              )),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
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

                  //Categories
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          translate(context, 'categories'),
                          style: LineItUpTextTheme().heading.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        const SizedBox(height: 16),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CategoryCard(
                                onTap: () {},
                                categoryText: translate(context, 'grocery'),
                                categoryImage: LineItUpImages.grocery,
                              ),
                              const SizedBox(width: 16),
                              CategoryCard(
                                onTap: () {},
                                categoryText: translate(context, 'fast_food'),
                                categoryImage: LineItUpImages.fastFood,
                              ),
                              const SizedBox(width: 16),
                              CategoryCard(
                                onTap: () {},
                                categoryText: translate(context, 'coffee'),
                                categoryImage: LineItUpImages.coffee,
                              ),
                              const SizedBox(width: 16),
                              CategoryCard(
                                onTap: () {},
                                categoryText: translate(context, 'pizza'),
                                categoryImage: LineItUpImages.pizza,
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
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  //divder
                  Container(
                    height: 6,
                    color: LineItUpColorTheme().grey20,
                  ),
                  const SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(translate(context, 'restaurants_near_you'),
                            style: LineItUpTextTheme().body.copyWith(
                                  fontWeight: FontWeight.w600,
                                )),
                        const SizedBox(height: 16),
                        const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              RestaurantCard(
                                image: LineItUpImages.restaurant1,
                                restaurantName: 'Tasty Fastfood & Bar B.B.Q',
                                rating: '4.7',
                                totalReviews: '7.4k',
                                distance: '0.4 mi',
                                deliveryTime: '30 min',
                                deliveryFee: '\$0',
                                deliveryFeeOver: '\$14',
                              ),
                              SizedBox(width: 8),
                              RestaurantCard(
                                image: LineItUpImages.restaurant2,
                                restaurantName: 'The Pizza Company',
                                rating: '4.5',
                                totalReviews: '5.4k',
                                distance: '0.4 mi',
                                deliveryTime: '30 min',
                                deliveryFee: '\$0',
                                deliveryFeeOver: '\$14',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(translate(context, 'popular_spots'),
                            style: LineItUpTextTheme().body.copyWith(
                                  fontWeight: FontWeight.w600,
                                )),
                        const SizedBox(height: 16),
                        const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              PopularSpotsCard(
                                image: LineItUpImages.popularSpot1,
                                spotName: 'Subway',
                                time: '30-45 min',
                              ),
                              SizedBox(width: 8),
                              PopularSpotsCard(
                                image: LineItUpImages.popularSpot2,
                                spotName: 'Starbucks',
                                time: '30 min',
                              ),
                              SizedBox(width: 8),
                              PopularSpotsCard(
                                image: LineItUpImages.popularSpot3,
                                spotName: 'McDonalds',
                                time: '30 min',
                              ),
                              SizedBox(width: 8),
                              PopularSpotsCard(
                                image: LineItUpImages.popularSpot1,
                                spotName: 'Subway',
                                time: '30-45 min',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(translate(context, 'shop_categories'),
                            style: LineItUpTextTheme().body.copyWith(
                                  fontWeight: FontWeight.w600,
                                )),
                        const SizedBox(height: 16),
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
                              const SizedBox(width: 8),
                              CategoryCard(
                                onTap: () {},
                                categoryText: 'Fast Food',
                                categoryImage: LineItUpImages.fastFood,
                                isSelected: true,
                              ),
                              const SizedBox(width: 8),
                              CategoryCard(
                                onTap: () {},
                                categoryText: 'Coffee',
                                categoryImage: LineItUpImages.coffee,
                                isSelected: true,
                              ),
                              const SizedBox(width: 8),
                              CategoryCard(
                                onTap: () {},
                                categoryText: 'Pizza',
                                categoryImage: LineItUpImages.pizza,
                                isSelected: true,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(translate(context, 'discount_offers'),
                            style: LineItUpTextTheme().body.copyWith(
                                  fontWeight: FontWeight.w600,
                                )),
                        const SizedBox(height: 12),
                        const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              RestaurantCard(
                                image: LineItUpImages.restaurant1,
                                restaurantName: 'Tasty Fastfood & Bar B.B.Q',
                                rating: '4.7',
                                totalReviews: '7.4k',
                                distance: '0.4 mi',
                                deliveryTime: '30 min',
                                deliveryFee: '\$0',
                                deliveryFeeOver: '\$14',
                                isDiscountShow: true,
                                discount: '30% discount',
                              ),
                              SizedBox(width: 8),
                              RestaurantCard(
                                image: LineItUpImages.restaurant2,
                                restaurantName: 'The Pizza Company',
                                rating: '4.5',
                                totalReviews: '5.4k',
                                distance: '0.4 mi',
                                deliveryTime: '30 min',
                                deliveryFee: '\$0',
                                deliveryFeeOver: '\$14',
                                isDiscountShow: true,
                                discount: '20% discount',
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
          )
        ],
      ),
    );
  }
}

class _DelverTOBottomSheet extends StatelessWidget {
  const _DelverTOBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      height: context.mHeight * 0.17,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translate(context, 'deliver_to'),
            style:
                LineItUpTextTheme().body.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: CustomElevatedButton(
              onTap: () {
                context.popPage();
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const _SelectLocationBottomSheet();
                  },
                );
              },
              rowMainAxisAlignment: MainAxisAlignment.start,
              title: translate(context, 'selected_location'),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              hasIcon: true,
              icon: LineItUpIcons().location1,
              iconColor: LineItUpColorTheme().white,
              iconSize: 15,
            ),
          )
        ],
      ),
    );
  }
}

class _SelectLocationBottomSheet extends StatelessWidget {
  const _SelectLocationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      height: context.mHeight * 0.23,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translate(context, 'deliver_to'),
            style:
                LineItUpTextTheme().body.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              context.pushPage(const UserSearchSomeWhereElsePage());
            },
            child: Row(
              children: [
                Icon(
                  LineItUpIcons().search,
                  size: 24,
                  color: LineItUpColorTheme().grey10,
                ),
                const SizedBox(width: 10),
                Text(
                  translate(context, 'search_somewhere_else'),
                  style: LineItUpTextTheme().body.copyWith(fontSize: 14),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              context.popPage();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  LineItUpIcons().location,
                  size: 24,
                  color: LineItUpColorTheme().black,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    translate(context, 'current_location'),
                    style: LineItUpTextTheme().body.copyWith(fontSize: 14),
                  ),
                ),
                Radio(
                    value: 0,
                    groupValue: 1,
                    onChanged: (value) {
                      context.popPage();
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
