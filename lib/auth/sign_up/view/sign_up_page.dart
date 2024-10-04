part of 'view.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUPCubit(), // Provide SignInCubit
      child: const SignUpView(),
    );
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Listen for tab changes and update the cubit state
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        // Update the cubit with the selected tab index
        context.read<SignUPCubit>().changeTab(_tabController.index);
      }
    });
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
            // Using BlocBuilder to listen for tab changes from the cubit
            BlocBuilder<SignUPCubit, SignUpState>(
              builder: (context, state) {
                return TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  indicatorColor: LineItUpColorTheme().primary,
                  labelColor: LineItUpColorTheme().primary,
                  unselectedLabelColor: LineItUpColorTheme().black,
                  dividerColor: LineItUpColorTheme().grey20,
                  indicatorSize: TabBarIndicatorSize
                      .label, // Indicator takes space of content
                  indicatorWeight: 4, // Indicator weight
                  dividerHeight: 4,
                  tabAlignment: TabAlignment.start,
                  tabs: [
                    Tab(
                      child: Row(
                        children: [
                          Icon(LineItUpIcons().user),
                          const SizedBox(width: 5),
                          Text(translate(context, 'user')),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Icon(LineItUpIcons().lineSkipperCross),
                          const SizedBox(width: 5),
                          Text(translate(context, 'line_skipper')),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: context.mHeight * 0.02),
            Text(translate(context, 'enter_your_email_address'),
                style: LineItUpTextTheme().heading),
            SizedBox(height: context.mHeight * 0.01),
            Text(
              translate(context, 'need_email_for_account_creation'),
              style: LineItUpTextTheme()
                  .body
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w300),
            ),
            SizedBox(height: context.mHeight * 0.04),
            Text(
              translate(context, 'email_address'),
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
            ),
            const CustomTextField(
              hintText: 'linitup@gmail.com',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: context.mHeight * 0.04),
            Row(
              children: [
                Text(
                  translate(context, 'have_an_account'),
                  style: LineItUpTextTheme()
                      .body
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w300),
                ),
                GestureDetector(
                  onTap: () {
                    context.pushPage(const LoginPage());
                  },
                  child: Text(
                    translate(context, 'login'),
                    style: LineItUpTextTheme().body.copyWith(
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          decorationColor: LineItUpColorTheme().primary,
                          fontWeight: FontWeight.bold,
                          color: LineItUpColorTheme().primary,
                        ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                title: translate(context, 'continue'),
                onTap: () {
                  // Navigate to the OTP page with the SignInCubit instance

                  context.pushPage(BlocProvider.value(
                    value: context.read<SignUPCubit>(),
                    child: const OtpPage(),
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
