part of 'view.dart';

class UserAddressAndPaymentPage extends StatelessWidget {
  const UserAddressAndPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserHomeCubit(),
      child: const _UserAddressAndPaymentView(),
    );
  }
}

class _UserAddressAndPaymentView extends StatelessWidget {
  const _UserAddressAndPaymentView();

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
                      LineItUpIcons().backArrow,
                      size: 32,
                      color: LineItUpColorTheme().black,
                    )),
                CircleButton(
                  onPressed: () {
                    context.pushPage(const UserSearchPage());
                  },
                  icon: LineItUpIcons().notification,
                  radius: 22,
                  backgroundColor: LineItUpColorTheme().grey,
                  iconColor: LineItUpColorTheme().white,
                )
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translate(context, 'delivery_address'),
                      style: LineItUpTextTheme().body.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const _DeliveryAdressBottomSheet();
                            });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: LineItUpColorTheme().grey20,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: LineItUpColorTheme().white,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Image.asset(LineItUpImages.locationPin),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Text('12348 street, LA',
                                  style: LineItUpTextTheme().body.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      )),
                            ),
                            Icon(
                              LineItUpIcons().rightArrow,
                              size: 20,
                              color: LineItUpColorTheme().black,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      translate(context, 'delivery_instructions'),
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hintText: translate(context, 'write_note_for_rider'),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      translate(context, 'delivery_time'),
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(LineItUpIcons().flash),
                        const SizedBox(width: 4),
                        Text('Delivery by 7:59pm',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: LineItUpColorTheme().primary,
                                )),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      translate(context, 'payment_method'),
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8),
                    _addPaymentMehtodButtom(context, () {
                      context.pushPage(const UserSelectPaymentMethodPage());
                    }),
                    const SizedBox(height: 20),
                    Text(
                      translate(context, 'tip_for_rider'),
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                        translate(context,
                            'your_selected_tip_go_directly_to_your_rider'),
                        style: LineItUpTextTheme().body.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: LineItUpColorTheme().grey,
                            )),
                    const SizedBox(height: 8),
                    _buildTipChipSelector(),
                    const SizedBox(height: 20),
                    Text(
                      translate(context, 'order_summary'),
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtotal',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                        Text('\$100',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delivery charges',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                        Text('\$5',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Packaging fee',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                        Text('\$0.11',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Platform fee',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
                        Text('\$1.11',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total amount',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                        Text('\$106.22',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text('\$106.22',
                    style: LineItUpTextTheme().body.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        )),
              ],
            ),
            const SizedBox(height: 24),
            CustomElevatedButton(
                width: double.infinity,
                title: translate(context, 'place_order'),
                onTap: () {
                  context.pushPage(const UserOrderProgressPage());
                })
          ],
        ),
      ),
    );
  }

  Widget _addPaymentMehtodButtom(BuildContext context, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: LineItUpColorTheme().grey20,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              LineItUpIcons().add,
              color: LineItUpColorTheme().black,
            ),
            const SizedBox(width: 10),
            Text(translate(context, 'add_payment_method'),
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    )),
          ],
        ),
      ),
    );
  }

  // Chip widget to handle both price and tip chips
  Widget _buildChip(
      BuildContext context, String label, int index, bool isSelected) {
    return GestureDetector(
      onTap: () {
        context.read<UserHomeCubit>().selectTipChip(index);
      },
      child: Chip(
        label: Text(label),
        backgroundColor: isSelected
            ? LineItUpColorTheme().primary
            : LineItUpColorTheme().white,
        labelStyle: LineItUpTextTheme().body.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? LineItUpColorTheme().white
                  : LineItUpColorTheme().black,
            ),
        labelPadding: const EdgeInsets.symmetric(horizontal: 5),
        side: BorderSide(
          color: isSelected
              ? LineItUpColorTheme().primary
              : LineItUpColorTheme().grey,
          width: 0.2,
        ),
      ),
    );
  }

  // Tip Chip Selector
  Widget _buildTipChipSelector() {
    return BlocBuilder<UserHomeCubit, UserHomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildChip(context, '\$5', 0, state.selectedTipChipIndex == 0),
              const SizedBox(width: 8),
              _buildChip(context, '\$10', 1, state.selectedTipChipIndex == 1),
              const SizedBox(width: 8),
              _buildChip(context, '\$12', 2, state.selectedTipChipIndex == 2),
              const SizedBox(width: 8),
              _buildChip(context, '\$15', 3, state.selectedTipChipIndex == 3),
              const SizedBox(width: 8),
              _buildChip(context, '\$20', 4, state.selectedTipChipIndex == 4),
              const SizedBox(width: 8),
              _buildChip(context, '\$100', 5, state.selectedTipChipIndex == 5),
              const SizedBox(width: 8),
              _buildChip(context, '\$150', 6, state.selectedTipChipIndex == 6),
            ],
          ),
        );
      },
    );
  }
}

class _DeliveryAdressBottomSheet extends StatelessWidget {
  const _DeliveryAdressBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      height: context.mHeight * 0.36,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translate(context, 'deliver_address'),
            style:
                LineItUpTextTheme().body.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              context.pushPage(const UserSearchSomeWhereElsePage());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              decoration: BoxDecoration(
                color: LineItUpColorTheme().grey20,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        LineItUpIcons().circle,
                        size: 24,
                        color: LineItUpColorTheme().black,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('12348 street, LA',
                              style: LineItUpTextTheme().body.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                          const SizedBox(height: 4),
                          Text('California',
                              style: LineItUpTextTheme().body.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: LineItUpColorTheme().grey,
                                  )),
                        ],
                      )
                    ],
                  ),
                  Icon(
                    LineItUpIcons().edit,
                    size: 24,
                    color: LineItUpColorTheme().black,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Row(
              children: [
                Icon(
                  LineItUpIcons().add,
                  size: 24,
                  color: LineItUpColorTheme().black,
                ),
                const SizedBox(width: 10),
                Text(translate(context, 'add_new_address'),
                    style: LineItUpTextTheme().body.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomElevatedButton(
                  width: context.mWidth * 0.44,
                  title: translate(context, 'cancel'),
                  onTap: () {
                    context.popPage();
                  }),
              CustomElevatedButton(
                  width: context.mWidth * 0.44,
                  title: translate(context, 'save'),
                  onTap: () {
                    context.popPage();
                  }),
            ],
          )
        ],
      ),
    );
  }
}
