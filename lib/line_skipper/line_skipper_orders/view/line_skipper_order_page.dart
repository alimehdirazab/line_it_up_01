part of 'view.dart';

class LineSkipperOrderPage extends StatelessWidget {
  const LineSkipperOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LineSkipperOrderCubit(),
      child: const LineSkipperOrderView(),
    );
  }
}

class LineSkipperOrderView extends StatefulWidget {
  const LineSkipperOrderView({super.key});

  @override
  State<LineSkipperOrderView> createState() => _LineSkipperOrderViewState();
}

class _LineSkipperOrderViewState extends State<LineSkipperOrderView>
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
        context.read<LineSkipperOrderCubit>().changeTab(_tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            // Using BlocBuilder to listen for tab changes from the cubit
            BlocBuilder<LineSkipperOrderCubit, LineSkipperOrderState>(
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
                      child: Text(translate(context, 'active_orders')),
                    ),
                    Tab(
                      child: Text(translate(context, 'completed_orders')),
                    ),
                  ],
                );
              },
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildActiveOrders(),
                  _buildCompletedOrders(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveOrders() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(translate(context, 'new_order'),
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )),
          const SizedBox(height: 10),
          OrderCard(
            storeName: 'Food for Health',
            storeAddress: 'ABCD Street, California',
            distance: 1.5,
            estimatedCost: 15.87,
            orders: const [
              'Arizona Drinks - 22 Oz',
              'Guerrero Riquisima Flour Tortillas',
              'Cranberry Juice - 3 Liter',
            ],
            acceptOrderButton: true,
            onAcceptOrderTap: () {
              context.pushPage(const LineSkipperOrderAcceptedPage());
            },
            rejectOrderButton: true,
            onRejectOrderTap: () {
              context.pushPage(const LineSkipperRejectOrderPage());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedOrders() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text('',
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )),
          const SizedBox(height: 10),
          const OrderCard(
            storeName: 'Food for Health',
            storeAddress: 'ABCD Street, California',
            distance: 1.5,
            estimatedCost: 15.87,
            orders: [
              'Arizona Drinks - 22 Oz',
              'Guerrero Riquisima Flour Tortillas',
              'Cranberry Juice - 3 Liter',
            ],
          ),
        ],
      ),
    );
  }
}
