part of 'view.dart';

class LineSkipperRejectOrderPage extends StatelessWidget {
  const LineSkipperRejectOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LineSkipperOrderCubit(),
      child: const LineSkipperRejectOrderView(),
    );
  }
}

class LineSkipperRejectOrderView extends StatefulWidget {
  const LineSkipperRejectOrderView({super.key});

  @override
  State<LineSkipperRejectOrderView> createState() =>
      _LineSkipperRejectOrderViewState();
}

class _LineSkipperRejectOrderViewState
    extends State<LineSkipperRejectOrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(translate(context, 'Please_select_the_reason'),
                  style: LineItUpTextTheme().heading),
              const SizedBox(height: 4),
              Text(
                  translate(context,
                      'select_the_reason_why_are_you_rejecting_the_order'),
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: LineItUpColorTheme().grey60,
                      )),
              const SizedBox(height: 20),
              _rejectionReasons(
                context,
                reason: 'I_dont_have_enough_amount_to_pay_on_shop',
                index: 1,
              ),
              _rejectionReasons(
                context,
                reason: 'the_order_size_is_too_large_to_carry_safely',
                index: 2,
              ),
              _rejectionReasons(
                context,
                reason: 'my_vehicle_is_not_functioning_properly',
                index: 3,
              ),
              _rejectionReasons(
                context,
                reason: 'the_order_details_are_unclear_or_incomplete',
                index: 4,
              ),
              _rejectionReasons(
                context,
                reason:
                    'there_is_heavy_traffic_or_road_closures_on_the_delivery_route',
                index: 5,
              ),
              _rejectionReasons(
                context,
                reason: 'weather_conditions_make_it_unsafe_for_delivery',
                index: 6,
              ),
              _rejectionReasons(
                context,
                reason:
                    'i_am_not_feeling_well_and_cannot_proceed_with_the_delivery',
                index: 7,
                divider: false,
              ),
              const SizedBox(height: 24),
              BlocBuilder<LineSkipperOrderCubit, LineSkipperOrderState>(
                  buildWhen: (previous, current) =>
                      previous.selectedReasonIndex !=
                      current.selectedReasonIndex,
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                        title: translate(context, 'next'),
                        buttonColor: state.selectedReasonIndex == 0
                            ? LineItUpColorTheme().secondary
                            : LineItUpColorTheme().primary,
                        onTap: () {
                          // Use the _selectedReasonIndex for processing the selected reason
                          if (state.selectedReasonIndex != 0) {
                            context.pushPage(
                                const LineSkipperConfirmRejectionPage());
                          } else {
                            // Process the selected reason
                          }
                        },
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rejectionReasons(BuildContext context,
      {required String reason, required int index, bool divider = true}) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(translate(context, reason),
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
            ),
            BlocBuilder<LineSkipperOrderCubit, LineSkipperOrderState>(
                buildWhen: (previous, current) =>
                    previous.selectedReasonIndex != current.selectedReasonIndex,
                builder: (context, state) {
                  return Radio(
                    value: index,
                    groupValue: state.selectedReasonIndex,
                    onChanged: (value) {
                      context
                          .read<LineSkipperOrderCubit>()
                          .selectReason(value as int);
                    },
                    activeColor: LineItUpColorTheme().black,
                  );
                }),
          ],
        ),
        const SizedBox(height: 16),
        divider ? const Divider() : const SizedBox(),
      ],
    );
  }
}
