part of 'view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const LoginPageView(),
    );
  }
}

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView>
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
        context.read<LoginCubit>().changeTab(_tabController.index);
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
                    height: context.mHeight * 0.17),
                IconButton(
                    icon: Icon(LineItUpIcons().cross,
                        color: LineItUpColorTheme().black),
                    onPressed: () {
                      context.pushAndRemoveUntilPage(const OnboardingPage());
                    }),
              ],
            ),
            // Using BlocBuilder to listen for tab changes from the cubit
            BlocBuilder<LoginCubit, LoginState>(
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
            Text(
              translate(context, 'enter_email_address'),
              style: LineItUpTextTheme().heading,
            ),
            SizedBox(height: context.mHeight * 0.01),
            Text(
              translate(context, 'email_address_sign_in'),
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
                  translate(context, 'dont_have_account'),
                  style: LineItUpTextTheme()
                      .body
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w300),
                ),
                GestureDetector(
                  onTap: () {
                    context.pushPage(const SignUpPage());
                  },
                  child: Text(
                    translate(context, 'sign_up'),
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
                    value: context.read<LoginCubit>(),
                    child: const EnterPasswordPage(),
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
