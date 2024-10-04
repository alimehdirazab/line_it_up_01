part of 'view.dart';

class FindingOrderPage extends StatelessWidget {
  const FindingOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FindingOrderView();
  }
}

class FindingOrderView extends StatelessWidget {
  const FindingOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          left: 18,
          right: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(LineItUpIcons().cross,
                      color: LineItUpColorTheme().black),
                  onPressed: () => Navigator.pop(context),
                ),
                CircleButton(
                  icon: LineItUpIcons().share,
                  onPressed: () {},
                  backgroundColor: LineItUpColorTheme().grey20,
                ),
              ],
            ),
            const SizedBox(height: 18),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translate(context, 'confirm_order'),
                      style: LineItUpTextTheme().heading,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(translate(context, 'estimated_time_remaining'),
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: LineItUpColorTheme().grey,
                                )),
                        Text(' 35:59 min',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: LineItUpColorTheme().grey,
                                )),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const TimeProgressBar(currentIndex: 1),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(translate(context, 'arrive_by'),
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: LineItUpColorTheme().grey,
                                )),
                        Text(' 6:30 PM',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
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
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 24),
                    Text(translate(context, 'line_skipper_details'),
                        style: LineItUpTextTheme().body.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            )),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Image.asset(LineItUpImages.manAvatar,
                            width: 40, height: 41),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sam Karen',
                                style: LineItUpTextTheme().body.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '4.5',
                                  style: LineItUpTextTheme().body.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: LineItUpColorTheme().grey,
                                      ),
                                ),
                                const SizedBox(width: 4),
                                Icon(
                                  LineItUpIcons().star,
                                  color: LineItUpColorTheme().yellow,
                                  size: 18,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleButton(
                          icon: LineItUpIcons().phone1,
                          onPressed: () {},
                          backgroundColor: LineItUpColorTheme().grey20,
                          radius: 25,
                        ),
                        CircleButton(
                          icon: LineItUpIcons().message,
                          onPressed: () {},
                          backgroundColor: LineItUpColorTheme().grey20,
                          radius: 25,
                        ),
                        Container(
                          width: context.mWidth * 0.57,
                          padding: const EdgeInsets.only(left: 12),
                          decoration: BoxDecoration(
                            color: LineItUpColorTheme().grey20,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: CustomTextField(
                            hintText: translate(context, 'send_a_message'),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                LineItUpIcons().send,
                                color: LineItUpColorTheme().black,
                                size: 22,
                              ),
                            ),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 12,
              ),
              color: LineItUpColorTheme().white,
              child: SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  title: translate(context, 'scan_qr_to_pay'),
                  onTap: () {
                    context.pushPage(const ScanQrPage());
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
