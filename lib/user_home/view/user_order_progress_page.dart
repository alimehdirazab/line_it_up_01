part of 'view.dart';

class UserOrderProgressPage extends StatelessWidget {
  const UserOrderProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _UserOrderProgressView();
  }
}

class _UserOrderProgressView extends StatefulWidget {
  const _UserOrderProgressView();

  @override
  State<_UserOrderProgressView> createState() => _UserOrderProgressViewState();
}

class _UserOrderProgressViewState extends State<_UserOrderProgressView> {
  @override
  void initState() {
    super.initState();
    // Use a post-frame callback to show the SnackBar after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Order placed successfully',
            style: LineItUpTextTheme().body.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: LineItUpColorTheme().black,
                ),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: LineItUpColorTheme().grey20,
        ),
      );
    });

    // Delay for 4 seconds before navigating to UserOrderCompletedPage
    Future.delayed(const Duration(seconds: 4), () {
      // ignore: use_build_context_synchronously
      context.pushPage(const UserOrderCompletedPage());
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
                      'Preparing your order',
                      style: LineItUpTextTheme().heading,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(translate(context, 'arrives_between'),
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: LineItUpColorTheme().grey,
                                )),
                        const SizedBox(width: 8),
                        Text('11:50 PM - 12:03 AM',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: LineItUpColorTheme().grey,
                                )),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const TimeProgressBar(currentIndex: 1),
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
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 24),
                    Text(translate(context, 'contact_your_rider'),
                        style: LineItUpTextTheme().body.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            )),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hintText:
                          translate(context, 'send_message_to_your_rider'),
                      suffixIcon: Icon(
                        LineItUpIcons().message,
                        color: LineItUpColorTheme().grey,
                        size: 24,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 16,
                      ),
                      filled: true,
                      fillColor: LineItUpColorTheme().grey20,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
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

