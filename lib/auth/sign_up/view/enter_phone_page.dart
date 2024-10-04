part of 'view.dart';

class EnterPhonePage extends StatelessWidget {
  const EnterPhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const EnterPhoneView();
  }
}

class EnterPhoneView extends StatefulWidget {
  const EnterPhoneView({super.key});

  @override
  State<EnterPhoneView> createState() => _EnterPhoneViewState();
}

class _EnterPhoneViewState extends State<EnterPhoneView> {
  String selectedCountryCode = '+1'; // Default country code

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(LineItUpIcons().backArrow,
                      color: LineItUpColorTheme().black),
                  onPressed: () => context.popPage(),
                ),
                Image.asset(LineItUpImages.appogo,
                    height: context.mHeight * 0.15),
                IconButton(
                    icon: Icon(LineItUpIcons().cross,
                        color: LineItUpColorTheme().black),
                    onPressed: () {
                      context.pushAndRemoveUntilPage(const OnboardingPage());
                    }),
              ],
            ),
            BlocBuilder<SignUPCubit, SignUpState>(builder: (context, state) {
              return state.userType == 0
                  ? Row(
                      children: [
                        Icon(LineItUpIcons().user, size: 16),
                        const SizedBox(width: 5),
                        Text(
                          translate(context, 'user'),
                          style: LineItUpTextTheme().body.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: LineItUpColorTheme().primary,
                              ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Icon(LineItUpIcons().lineSkipperCross, size: 16),
                        const SizedBox(width: 5),
                        Text(
                          translate(context, 'line_skipper'),
                          style: LineItUpTextTheme().body.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: LineItUpColorTheme().primary,
                              ),
                        ),
                      ],
                    );
            }),
            const SizedBox(height: 10),
            Text(
              translate(context, 'enter_your_phone_number'),
              style: LineItUpTextTheme().heading,
            ),
            SizedBox(height: context.mHeight * 0.04),
            Text(
              translate(context, 'phone_number'),
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
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
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                title: translate(context, 'almost_there'),
                onTap: () {
                  context.read<SignUPCubit>().state.userType == 0
                      ? context.pushPage(const RootPage())
                      : context.pushPage(const LineSkipperRootPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
