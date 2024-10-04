part of 'view.dart';

class LineSkipperStatisticsPage extends StatelessWidget {
  const LineSkipperStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LineSkipperStatisticsCubit(),
      child: const LineSkipperStatisticsView(),
    );
  }
}

class LineSkipperStatisticsView extends StatefulWidget {
  const LineSkipperStatisticsView({super.key});

  @override
  State<LineSkipperStatisticsView> createState() =>
      _LineSkipperStatisticsViewState();
}

class _LineSkipperStatisticsViewState extends State<LineSkipperStatisticsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    // Listen for tab changes and update the cubit state
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        // Update the cubit with the selected tab index
        context
            .read<LineSkipperStatisticsCubit>()
            .changeTab(_tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate(context, 'statistics'),
            style: LineItUpTextTheme().body.copyWith(
                  fontWeight: FontWeight.w600,
                )),
        centerTitle: true,
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          indicatorColor: LineItUpColorTheme().primary,
          labelColor: LineItUpColorTheme().primary,
          unselectedLabelColor: LineItUpColorTheme().black,
          dividerColor: LineItUpColorTheme().grey20,
          indicatorSize:
              TabBarIndicatorSize.label, // Indicator takes space of content
          indicatorWeight: 4, // Indicator weight
          dividerHeight: 4,
          tabAlignment: TabAlignment.start,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          labelPadding: const EdgeInsets.symmetric(horizontal: 20),
          tabs: [
            Tab(
              child: Text(translate(context, 'daily')),
            ),
            Tab(
              child: Text(translate(context, 'weekly')),
            ),
            Tab(
              child: Text(translate(context, 'monthly')),
            ),
            Tab(
              child: Text(translate(context, 'yearly')),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          LineSkipperDailyStatisticsView(),
          LineSkipperWeeklyStatisticsView(),
          LineSkipperMonthlyStatisticsView(),
          LineSkipperYearlyStatisticsView(),
        ],
      ),
    );
  }
}
