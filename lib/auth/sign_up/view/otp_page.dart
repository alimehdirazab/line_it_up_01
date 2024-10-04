part of 'view.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OtpView();
  }
}

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SignUPCubit>().startOtpTimer();
  }

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
            BlocBuilder<SignUPCubit, SignUpState>(
                buildWhen: (previous, current) =>
                    previous.userType != current.userType,
                builder: (context, state) {
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
              translate(context, 'enter_otp'),
              style: LineItUpTextTheme().heading,
            ),
            SizedBox(height: context.mHeight * 0.01),
            Text(
              translate(context, 'otp_code_sent'),
              style: LineItUpTextTheme()
                  .body
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: context.mHeight * 0.04),
            Text(
              translate(context, 'otp'),
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
            ),
            CustomTextField(
              controller: otpController,
              hintText: '.  .  .  .  .  .',
              keyboardType: TextInputType.number,
              onChanged: (value) {
                context.read<SignUPCubit>().validateOtpLength(value);
              },
              suffixIcon: BlocBuilder<SignUPCubit, SignUpState>(
                  buildWhen: (previous, current) =>
                      previous.otpTimer != current.otpTimer,
                  builder: (context, state) {
                    return Text(
                      '00: ${state.otpTimer.toString().padLeft(2, '0')}',
                      style: LineItUpTextTheme()
                          .body
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                    );
                  }),
            ),
            SizedBox(height: context.mHeight * 0.04),
            const Spacer(),
            BlocBuilder<SignUPCubit, SignUpState>(
                buildWhen: (previous, current) =>
                    previous.isOtpLengthValid != current.isOtpLengthValid,
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      onTap: () {
                        if (state.isOtpLengthValid) {
                          // Navigate to the OTP page with the SignInCubit instance
                          context.pushPage(BlocProvider.value(
                            value: context.read<SignUPCubit>(),
                            child: const CreatePasswordPage(),
                          ));
                        }
                      },
                      title: translate(context, 'continue'),
                      buttonColor: state.isOtpLengthValid
                          ? LineItUpColorTheme().primary
                          : LineItUpColorTheme().secondary,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
