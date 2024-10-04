part of 'view.dart';

class LineSkipperHomePage extends StatelessWidget {
  const LineSkipperHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LineSkipperHomeView();
  }
}

class LineSkipperHomeView extends StatelessWidget {
  const LineSkipperHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                // width: double.infinity,
                // height: context.mHeight * 0.37,
                padding: const EdgeInsets.only(left: 12, right: 12, top: 48),
                decoration: BoxDecoration(
                  color: LineItUpColorTheme().cGreen,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _statusCard(context),
                    const SizedBox(height: 55),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Alex William',
                              style: LineItUpTextTheme().body.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: LineItUpColorTheme().white),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Monthly Earning',
                              style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: LineItUpColorTheme().white),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '\$1,000.43',
                              style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: LineItUpColorTheme().white),
                            ),
                          ],
                        ),
                        Image.asset(
                          LineItUpImages.lineSkipper,
                          // width: 136,
                          // height: 143,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          BlocBuilder<LineSkipperHomeCubit, LineSkipperHomeState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                return state.status == LineSkipperStatus.offline
                    ? Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          decoration: BoxDecoration(
                            color: LineItUpColorTheme().grey20,
                            border: Border.all(
                              color: LineItUpColorTheme().grey50,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(LineItUpIcons().infomsg,
                                  color: LineItUpColorTheme().black),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                    translate(context,
                                        'when_your_status_on_the_app_is_set_to_offline_you_will_not_receive_any_orders'),
                                    style: LineItUpTextTheme().body.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        )),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox();
              }),
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(translate(context, 'daily_stats'),
                            style: LineItUpTextTheme().body.copyWith(
                                  fontWeight: FontWeight.w600,
                                )),
                        Text(
                          'Monday, Sept 16',
                          style: LineItUpTextTheme().body.copyWith(
                              fontSize: 10, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _dailyStateBox(
                            context: context,
                            title: translate(context, 'earnings'),
                            value: '\$1000',
                          ),
                          const SizedBox(width: 8),
                          _dailyStateBox(
                            context: context,
                            title: translate(context, 'hours_work'),
                            value: '6 hr',
                          ),
                          const SizedBox(width: 8),
                          _dailyStateBox(
                            context: context,
                            title: translate(context, 'orders'),
                            value: '6',
                          ),
                          const SizedBox(width: 8),
                          _dailyStateBox(
                            context: context,
                            title: translate(context, 'tips'),
                            value: '\$15',
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<LineSkipperHomeCubit, LineSkipperHomeState>(
                        buildWhen: (previous, current) =>
                            previous.status != current.status,
                        builder: (context, state) {
                          return state.status == LineSkipperStatus.online
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 24),
                                    Text(
                                      translate(context, 'active_order'),
                                      style: LineItUpTextTheme().body.copyWith(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 8),
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
                                      viewOrderButton: true,
                                      showMap: true,
                                    ),
                                  ],
                                )
                              : const SizedBox();
                        })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusCard(BuildContext context) {
    return BlocBuilder<LineSkipperHomeCubit, LineSkipperHomeState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return Container(
            height: 65,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: LineItUpColorTheme().grey20,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(translate(context, 'status'),
                            style: LineItUpTextTheme().body.copyWith(
                                  fontWeight: FontWeight.w600,
                                )),
                        const SizedBox(width: 5),
                        Text(
                            translate(
                              context,
                              state.status == LineSkipperStatus.online
                                  ? 'online'
                                  : 'offline',
                            ),
                            style: LineItUpTextTheme().body.copyWith(
                                  color:
                                      state.status == LineSkipperStatus.online
                                          ? LineItUpColorTheme().green
                                          : LineItUpColorTheme().red,
                                  fontWeight: FontWeight.w600,
                                )),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Flexible(
                      child: Text(
                        translate(
                            context,
                            state.status == LineSkipperStatus.online
                                ? 'switch_off_button_to_disable_your_status'
                                : 'switch_on_button_to_enable_your_status'),
                        style: LineItUpTextTheme().body.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Switch(
                  value: state.status == LineSkipperStatus.online,
                  onChanged: (value) {
                    context
                        .read<LineSkipperHomeCubit>()
                        .toggleLineSkipperStatus();
                  },
                  activeColor: LineItUpColorTheme().green,
                  activeTrackColor: LineItUpColorTheme().grey40,
                  inactiveTrackColor: LineItUpColorTheme().grey40,
                  inactiveThumbColor: LineItUpColorTheme().grey,
                  trackOutlineColor:
                      WidgetStateProperty.all(LineItUpColorTheme().grey40),
                  trackOutlineWidth: const WidgetStatePropertyAll(0),
                ),
              ],
            ),
          );
        });
  }

  Widget _dailyStateBox({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: context.mWidth / 4,
          height: 83,
          decoration: BoxDecoration(
              color: LineItUpColorTheme().grey20,
              borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(
              value,
              style: LineItUpTextTheme()
                  .heading
                  .copyWith(color: LineItUpColorTheme().grey),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: LineItUpTextTheme().body.copyWith(
                fontSize: 12,
              ),
        ),
      ],
    );
  }
}
