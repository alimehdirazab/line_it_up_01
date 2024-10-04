part of 'view.dart';

class LineSkipperConfirmRejectionPage extends StatelessWidget {
  const LineSkipperConfirmRejectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LineSkipperConfirmRejectionView();
  }
}

class LineSkipperConfirmRejectionView extends StatelessWidget {
  const LineSkipperConfirmRejectionView({super.key});

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
              Text(translate(context, 'cancelling_order'),
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
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
                              'you_cannot_reject_multiple_request_at_the_same_day_it_will_impact_your_profile'),
                          style: LineItUpTextTheme().body.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(translate(context, 'where_to_go'),
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )),
              const SizedBox(height: 8),
              Text('ABCD street, California',
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: LineItUpColorTheme().grey,
                      )),
              const SizedBox(height: 24),
              Text(translate(context, 'distance'),
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )),
              const SizedBox(height: 8),
              Text('1.3 mi',
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: LineItUpColorTheme().grey,
                      )),
              const SizedBox(height: 24),
              Text(translate(context, 'order_details'),
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )),
              const SizedBox(height: 8),
              Text('Cost Less Food Company',
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: LineItUpColorTheme().grey,
                      )),
              const SizedBox(height: 8),
              Text('Arizona Drinks - 22 Oz',
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: LineItUpColorTheme().grey,
                      )),
              const SizedBox(height: 8),
              Text('Guerrero Riquisima Flour Tortillas',
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: LineItUpColorTheme().grey,
                      )),
              const SizedBox(height: 8),
              Text('Cranberry Juice - 3 Liter',
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: LineItUpColorTheme().grey,
                      )),
              const SizedBox(height: 24),
              Text(translate(context, 'order_instruction'),
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )),
              const SizedBox(height: 8),
              Text(translate(context, 'none'),
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: LineItUpColorTheme().grey,
                      )),
              const SizedBox(height: 24),
              Text(translate(context, 'estimated_order_price'),
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )),
              const SizedBox(height: 8),
              Text('\$20-40',
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: LineItUpColorTheme().grey,
                      )),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  title: translate(context, 'reject_order'),
                  onTap: () {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                        translate(context, 'i_have_changed_my_mind_accept_it'),
                        style: LineItUpTextTheme().body.copyWith(
                              color: LineItUpColorTheme().black,
                            )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
