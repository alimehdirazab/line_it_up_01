part of 'view.dart';

class UserPickupAddressAndPaymentPage extends StatelessWidget {
  const UserPickupAddressAndPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserHomeCubit(),
      child: const _UserPickupAddressAndPaymentView(),
    );
  }
}

class _UserPickupAddressAndPaymentView extends StatefulWidget {
  const _UserPickupAddressAndPaymentView();

  @override
  State<_UserPickupAddressAndPaymentView> createState() =>
      _UserPickupAddressAndPaymentViewState();
}

class _UserPickupAddressAndPaymentViewState
    extends State<_UserPickupAddressAndPaymentView> {
  String selectedCountryCode = '+1'; // Default country code
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
                      translate(context, 'pickup_location'),
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
                              child: Text('21 Ave, California',
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
                    const Divider(),
                    const SizedBox(height: 20),
                    Text(
                      translate(context, 'pickup_day'),
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8),
                    _buildDayChipSelector(),
                    const SizedBox(height: 16),
                    Text(
                      translate(context, 'schedule_pickup'),
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 12),
                    _selectPickupTimingsButton(context, () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const _PickupTimeBottomSheet();
                          });
                    }),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          translate(context, 'phone_number'),
                          style: LineItUpTextTheme().body.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Text('*',
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: LineItUpColorTheme().red,
                                )),
                      ],
                    ),
                    Row(
                      children: [
                        CountryCodePicker(
                          onChanged: (country) {
                            setState(() {
                              selectedCountryCode = country.dialCode!;
                            });
                          },
                          initialSelection: selectedCountryCode,
                          favorite: const ['+1', 'US'],
                          showFlag: true,
                          alignLeft: false,
                          textStyle: LineItUpTextTheme().body.copyWith(
                                fontSize: 14,
                                color: LineItUpColorTheme().black,
                              ),
                        ),
                        const Flexible(
                          child: CustomTextField(
                            hintText: 'Phone number',
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 20),
                    Text(
                      translate(context, 'payment_method'),
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8),
                    _addPaymentMehtodButton(context, () {
                      context.pushPage(const UserSelectPaymentMethodPage());
                    }),
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
                  context.pushPage(const UserPlacingPickupOrderPage());
                })
          ],
        ),
      ),
    );
  }

  Widget _addPaymentMehtodButton(BuildContext context, void Function()? onTap) {
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

  Widget _selectPickupTimingsButton(
      BuildContext context, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: LineItUpColorTheme().grey20,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(translate(context, 'schedule_pickup_timings'),
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
            Icon(
              LineItUpIcons().rightArrow,
              color: LineItUpColorTheme().black,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  // Chip widget to handle both price and tip chips
  Widget _buildChip(BuildContext context, String label, String date, int index,
      bool isSelected) {
    return GestureDetector(
      onTap: () {
        context.read<UserHomeCubit>().selectDayChip(index);
      },
      child: Container(
        width: 98,
        height: 58,
        decoration: BoxDecoration(
          color: isSelected
              ? LineItUpColorTheme().primary
              : LineItUpColorTheme().grey20,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(label,
                style: LineItUpTextTheme().body.copyWith(
                      color: isSelected
                          ? LineItUpColorTheme().white
                          : LineItUpColorTheme().black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    )),
            const SizedBox(height: 2),
            Text(date,
                style: LineItUpTextTheme().body.copyWith(
                      color: isSelected
                          ? LineItUpColorTheme().white
                          : LineItUpColorTheme().black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    )),
          ],
        ),
      ),
    );
  }

  // Tip Chip Selector
  Widget _buildDayChipSelector() {
    return BlocBuilder<UserHomeCubit, UserHomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildChip(context, 'Today', 'Oct 10', 0,
                  state.selectedDayChipIndex == 0),
              const SizedBox(width: 8),
              _buildChip(context, 'Tomorow', 'Oct 11', 1,
                  state.selectedDayChipIndex == 1),
              const SizedBox(width: 8),
              _buildChip(context, 'Saturday', 'Oct 12', 2,
                  state.selectedDayChipIndex == 2),
              const SizedBox(width: 8),
              _buildChip(context, 'Sunday', 'Oct 13', 3,
                  state.selectedDayChipIndex == 3),
              const SizedBox(width: 8),
              _buildChip(context, 'Monday', 'Oct 14', 4,
                  state.selectedDayChipIndex == 4),
              const SizedBox(width: 8),
              _buildChip(context, 'Tuesday', 'Oct 15', 5,
                  state.selectedDayChipIndex == 5),
              const SizedBox(width: 8),
              _buildChip(context, 'Wednesday', 'Oct 16', 6,
                  state.selectedDayChipIndex == 6),
            ],
          ),
        );
      },
    );
  }
}

class _PickupTimeBottomSheet extends StatelessWidget {
  const _PickupTimeBottomSheet();

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
            translate(context, 'schedule_pickup_time'),
            style:
                LineItUpTextTheme().body.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 150,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('11:00 AM - 11:30 AM',
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                  const SizedBox(height: 24),
                  Text('11:30 AM - 12:00 PM',
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                  const SizedBox(height: 24),
                  Text('12:00 PM - 12:30 PM',
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                  const SizedBox(height: 24),
                  Text('12:30 PM - 01:00 PM',
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                  const SizedBox(height: 24),
                  Text('01:00 PM - 01:30 PM',
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                  const SizedBox(height: 24),
                  Text('01:30 PM - 02:00 PM',
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          CustomElevatedButton(
            width: double.infinity,
            title: translate(context, 'schedule'),
            onTap: () => context.popPage(),
          )
        ],
      ),
    );
  }
}
