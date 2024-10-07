part of 'view.dart';

class UserPlacingPickupOrderPage extends StatelessWidget {
  const UserPlacingPickupOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _UserPlacingPickupOrderView();
  }
}

class _UserPlacingPickupOrderView extends StatelessWidget {
  const _UserPlacingPickupOrderView();

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
                      LineItUpIcons().cross,
                      size: 32,
                      color: LineItUpColorTheme().black,
                    )),
                CircleButton(
                  onPressed: () {},
                  icon: LineItUpIcons().share,
                  radius: 22,
                  backgroundColor: LineItUpColorTheme().grey20,
                  iconColor: LineItUpColorTheme().black,
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Placing pickup order',
                      style: LineItUpTextTheme().heading,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text('Arrive there at',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: LineItUpColorTheme().grey,
                                )),
                        const SizedBox(width: 8),
                        Text('12:03 AM',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: LineItUpColorTheme().grey,
                                )),
                      ],
                    ),
                    const SizedBox(height: 16),
                    LinearProgressIndicator(
                      backgroundColor: LineItUpColorTheme().primary,
                    ),
                    const SizedBox(height: 24),
                    Text(translate(context, 'order_details'),
                        style: LineItUpTextTheme().body.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            )),
                    const SizedBox(height: 4),
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
                    Text(translate(context, 'scheduled_order'),
                        style: LineItUpTextTheme().body.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            )),
                    const SizedBox(height: 8),
                    Text('Monday Sept 5, 9:30 PM - 10:00 PM',
                        style: LineItUpTextTheme().body.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: LineItUpColorTheme().grey,
                            )),
                    const SizedBox(height: 24),
                    Text(translate(context, 'order_price'),
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
                    const SizedBox(height: 24),
                    Text(translate(context, 'payment_method'),
                        style: LineItUpTextTheme().body.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            )),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset(LineItUpImages.masterCard),
                        SizedBox(width: context.mWidth * 0.02),
                        Text('Master card',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: LineItUpColorTheme().grey,
                                )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
