part of 'view.dart';

class LineSkipperWaitingInQueuePage extends StatelessWidget {
  const LineSkipperWaitingInQueuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LineSkipperWaitingInQueueView();
  }
}

class LineSkipperWaitingInQueueView extends StatelessWidget {
  const LineSkipperWaitingInQueueView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 18,
          right: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(LineItUpIcons().cross,
                      color: LineItUpColorTheme().black),
                  onPressed: () => Navigator.pop(context),
                ),
                const Spacer(),
                CircleButton(
                  icon: LineItUpIcons().phone1,
                  onPressed: () {},
                  backgroundColor: LineItUpColorTheme().grey20,
                ),
                const SizedBox(width: 12),
                CircleButton(
                  icon: LineItUpIcons().message,
                  onPressed: () {},
                  backgroundColor: LineItUpColorTheme().grey20,
                ),
              ],
            ),
            SizedBox(height: context.mHeight * 0.03),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translate(context, 'waiting_in_queue'),
                      style: LineItUpTextTheme().heading,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(translate(context, 'queue_time'),
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
                    const TimeProgressBar(totalIndex: 2, currentIndex: 1),
                    const SizedBox(height: 24),
                    Text(translate(context, 'people_in_queue'),
                        style: LineItUpTextTheme().body.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            )),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () => _showDialog(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        decoration: BoxDecoration(
                          color: LineItUpColorTheme().grey20,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Text('8',
                                style: LineItUpTextTheme().body.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )),
                            const SizedBox(width: 8),
                            Text(translate(context, 'persons_in_queue'),
                                style: LineItUpTextTheme().body.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: LineItUpColorTheme().grey,
                                    )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            translate(
                                context, 'update_queue_after_every_2_min'),
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: LineItUpColorTheme().grey60,
                                )),
                        Text('01:12 min',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: LineItUpColorTheme().grey60,
                                )),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Divider(),
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
                    Text(
                        translate(context,
                            'chat_with_user_Mention_if_any_item_is_not_available'),
                        style: LineItUpTextTheme().body.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            )),
                    CustomTextField(
                        hintText: translate(context, 'type_your_message'),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            LineItUpIcons().send,
                            color: LineItUpColorTheme().grey,
                            size: 30,
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: context.mHeight * 0.02,
                horizontal: context.mWidth * 0.02,
              ),
              color: LineItUpColorTheme().white,
              child: SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  title: translate(context, 'complete_order'),
                  onTap: () {
                    context.pushPage(const LineSkipperQrPage());
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Makes sure the dialog fits its content
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Update queue',
                  style: LineItUpTextTheme().body.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 14),
                CustomTextField(
                  hintText: translate(context, 'input_queue_in_digits'),
                  keyboardType: TextInputType.number,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    title: 'Update',
                    onTap: () {
                      Navigator.pop(context); // Close the dialog after updating
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
