part of 'view.dart';

class UserOrderPage extends StatelessWidget {
  const UserOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserHomeCubit(),
      child: const _UserOrderView(),
    );
  }
}

class _UserOrderView extends StatefulWidget {
  const _UserOrderView();

  @override
  State<_UserOrderView> createState() => _UserOrderViewState();
}

class _UserOrderViewState extends State<_UserOrderView>
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
        context.read<UserHomeCubit>().changeTab(
            _tabController.index == 0 ? TabOption.delivery : TabOption.pickup);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          translate(context, 'orders'),
          style: LineItUpTextTheme().body.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
        ),
        // centerTitle: true,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: context.mWidth * 0.04),
              child: Row(
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
              )),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 17),
          //   child: CustomTopbarWidget(
          //     title: "Orders",
          //     icon: LineItUpIcons().notification,
          //   ),
          // ),
          BlocBuilder<UserHomeCubit, UserHomeState>(
            builder: (context, state) {
              return TabBar(
                isScrollable: true,
                controller: _tabController,
                indicatorColor: LineItUpColorTheme().primary,
                labelColor: LineItUpColorTheme().primary,
                unselectedLabelColor: LineItUpColorTheme().black,
                dividerColor: LineItUpColorTheme().grey20,
                indicatorSize: TabBarIndicatorSize.label,
                // Indicator takes space of content
                indicatorWeight: 4,
                // Indicator weight
                dividerHeight: 4,
                tabAlignment: TabAlignment.start,
                padding: const EdgeInsets.symmetric(horizontal: 17),
                tabs: [
                  Tab(
                    child: Row(
                      children: [
                        Icon(LineItUpIcons().delivery),
                        const SizedBox(width: 4),
                        Text(
                          translate(context, 'delivery'),
                          style: LineItUpTextTheme().body.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: _tabController.index == 0
                                  ? LineItUpColorTheme().primary
                                  : LineItUpColorTheme().black),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        Icon(LineItUpIcons().car),
                        const SizedBox(width: 4),
                        Text(
                          translate(context, 'pickup'),
                          style: LineItUpTextTheme().body.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: _tabController.index == 1
                                  ? LineItUpColorTheme().primary
                                  : LineItUpColorTheme().black),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        Icon(LineItUpIcons().lineSkipperCross),
                        const SizedBox(width: 4),
                        Text(
                          translate(context, 'line_skipper'),
                          style: LineItUpTextTheme().body.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: _tabController.index == 2
                                    ? LineItUpColorTheme().primary
                                    : LineItUpColorTheme().black,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(child: _buildDelivery()),
                SingleChildScrollView(child: _buildPickup()),
                SingleChildScrollView(child: _buildlineSkipper())
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDelivery() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            translate(context, 'in_progress'),
            style: LineItUpTextTheme()
                .body
                .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
          ),

          // const SizedBox(height: 16),
          Text('',
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )),
          const SizedBox(height: 10),

          CustomCardWidget(
            status: "Picking up your order",
            category: "Food for health",
            cost: "15.87",
            icon: LineItUpIcons().flash,
            estimatedAndStatus: "Delivery by 7:59pm-8:10pm",
            onPressed: () {},
          ),

          const SizedBox(height: 24),

          Divider(
            color: LineItUpColorTheme().grey20,
          ),

          const SizedBox(height: 24),

          const CustomStatusWidget(
            cost: "15.87",
            date: "Sunday, 12 Aug",
            estimatedTime: "10:30pm",
            shopName: "McDonald's",
            showDivider: true,
          ),

          const SizedBox(
            height: 24,
          ),

          const CustomStatusWidget(
              cost: "15.87",
              date: "Sunday, 12 Aug",
              estimatedTime: "10:30pm",
              shopName: "McDonald's"),
        ],
      ),
    );
  }

  Widget _buildPickup() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            translate(context, 'in_progress'),
            style: LineItUpTextTheme()
                .body
                .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          // const SizedBox(height: 16),
          Text('',
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )),
          const SizedBox(height: 10),

          CustomCardWidget(
            status: "Picking up your order",
            category: "Food for health",
            cost: "15.87",
            icon: LineItUpIcons().hail,
            estimatedAndStatus: "Pickup by 7:59pm-8:10pm",
            onPressed: () {},
          ),

          const SizedBox(height: 24),

          Divider(
            color: LineItUpColorTheme().grey20,
          ),

          const SizedBox(height: 24),

          const CustomStatusWidget(
            cost: "15.87",
            date: "Sunday, 12 Aug",
            estimatedTime: "Pickup at 10:30pm",
            shopName: "McDonald's",
            showDivider: true,
          ),

          const SizedBox(
            height: 24,
          ),

          const CustomStatusWidget(
              cost: "15.87",
              date: "Sunday, 12 Aug",
              estimatedTime: "Pickup at 10:30pm",
              shopName: "McDonald's"),
        ],
      ),
    );
  }

  Widget _buildlineSkipper() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            translate(context, 'in_progress'),
            style: LineItUpTextTheme()
                .body
                .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          // const SizedBox(height: 16),
          Text('',
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )),
          const SizedBox(height: 10),

          CustomCardWidget(
            status: "Waiting in queue",
            category: "Cost Less Food Company",
            icon: LineItUpIcons().hail,
            estimatedAndStatus: "Estimated pickup at 10:30pm",
            onPressed: () {},
          ),

          const SizedBox(height: 24),

          Divider(
            color: LineItUpColorTheme().grey20,
          ),

          const SizedBox(height: 24),

          const CustomStatusWidget(
            cost: "15.87",
            date: "Sunday, 12 Aug",
            estimatedTime: "Pickup at 10:30pm",
            shopName: "McDonald's",
            showDivider: true,
          ),

          const SizedBox(
            height: 24,
          ),

          const CustomStatusWidget(
              cost: "15.87",
              date: "Sunday, 12 Aug",
              estimatedTime: "Pickup at 10:30pm",
              shopName: "McDonald's"),
        ],
      ),
    );
  }
}
