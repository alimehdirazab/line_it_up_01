part of 'view.dart';

class CreatePasswordPage extends StatelessWidget {
  const CreatePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreatePasswordView();
  }
}

class CreatePasswordView extends StatelessWidget {
  const CreatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    // Focus node to control focus on the text field
    final FocusNode passwordFocusNode = FocusNode();

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
              translate(context, 'create_password'),
              style: LineItUpTextTheme().heading,
            ),
            SizedBox(height: context.mHeight * 0.01),
            Text(
              translate(context, 'use_8_characters'),
              style: LineItUpTextTheme()
                  .body
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: context.mHeight * 0.04),
            Text(
              translate(context, 'enter_password'),
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
            ),
            BlocBuilder<SignUPCubit, SignUpState>(
                buildWhen: (previous, current) =>
                    previous.isPasswordObscure != current.isPasswordObscure,
                builder: (context, state) {
                  return CustomTextField(
                    focusNode: passwordFocusNode, // Attach the focus node
                    hintText: '********',
                    keyboardType: TextInputType.emailAddress,
                    obscureText: state.isPasswordObscure,
                  );
                }),
            SizedBox(height: context.mHeight * 0.04),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // Toggle password visibility and keep focus on the text field
                    context.read<SignUPCubit>().togglePasswordObscure();
                    FocusScope.of(context).requestFocus(passwordFocusNode);
                  },
                  child: BlocBuilder<SignUPCubit, SignUpState>(
                      buildWhen: (previous, current) =>
                          previous.isPasswordObscure !=
                          current.isPasswordObscure,
                      builder: (context, state) {
                        return Text(
                          translate(
                              context,
                              state.isPasswordObscure
                                  ? 'show_password'
                                  : 'hide_password'),
                          style: LineItUpTextTheme().body.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: LineItUpColorTheme().primary,
                              ),
                        );
                      }),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                title: translate(context, 'continue'),
                onTap: () {
                  context.pushPage(BlocProvider.value(
                    value: context.read<SignUPCubit>(),
                    child: const ReEnterPasswordPage(),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
