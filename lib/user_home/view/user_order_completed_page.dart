part of 'view.dart';

class UserOrderCompletedPage extends StatelessWidget {
  const UserOrderCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _UserOrderCompletedView();
  }
}

class _UserOrderCompletedView extends StatefulWidget {
  const _UserOrderCompletedView();

  @override
  State<_UserOrderCompletedView> createState() =>
      _UserOrderCompletedViewState();
}

class _UserOrderCompletedViewState extends State<_UserOrderCompletedView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      showModalBottomSheet(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => const _RatingBottomSheet());
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
                      'Order Completed',
                      style: LineItUpTextTheme().heading,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text('Arrived at',
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
                    Text(translate(context, 'order_instruction'),
                        style: LineItUpTextTheme().body.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            )),
                    const SizedBox(height: 8),
                    Text('None',
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
                    const SizedBox(height: 24),
                    Text(translate(context, 'tip_for_rider'),
                        style: LineItUpTextTheme().body.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            )),
                    const SizedBox(height: 8),
                    Text('\$5',
                        style: LineItUpTextTheme().body.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: LineItUpColorTheme().grey,
                            )),
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

class _RatingBottomSheet extends StatelessWidget {
  const _RatingBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        height: context.mHeight * 0.38,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cost Less Food Company',
                        style: LineItUpTextTheme().heading.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                    const SizedBox(height: 4),
                    Text('\$8.76',
                        style: LineItUpTextTheme().body.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: LineItUpColorTheme().grey,
                            )),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border.all(color: LineItUpColorTheme().grey20),
                      borderRadius: BorderRadius.circular(40)),
                  child: Image.asset(
                    LineItUpImages.store1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 16),
            Text(translate(context, 'rate_your_rider'),
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
            const SizedBox(height: 4),
            Text(translate(context, 'how_was_your_delivery_with_line_skipper'),
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: LineItUpColorTheme().grey,
                    )),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: LineItUpColorTheme().yellow,
                  size: 48,
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.star,
                  color: LineItUpColorTheme().yellow,
                  size: 48,
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.star,
                  color: LineItUpColorTheme().yellow,
                  size: 48,
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.star,
                  color: LineItUpColorTheme().yellow,
                  size: 48,
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.star,
                  color: LineItUpColorTheme().grey,
                  size: 48,
                ),
              ],
            ),
            const SizedBox(height: 24),
            CustomElevatedButton(
                width: double.infinity,
                title: translate(context, 'submit'),
                onTap: () {
                  context.pushAndRemoveUntilPage(const RootPage());
                })
          ],
        ));
  }
}
