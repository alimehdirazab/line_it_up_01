part of 'view.dart';

class LineSkipperResetPasswordPage extends StatelessWidget {
  const LineSkipperResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LineSkipperManageAccountCubit(),
      child: const LineSkipperResetPasswordView(),
    );
  }
}

class LineSkipperResetPasswordView extends StatefulWidget {
  const LineSkipperResetPasswordView({super.key});

  @override
  State<LineSkipperResetPasswordView> createState() =>
      _LineSkipperResetPasswordViewState();
}

class _LineSkipperResetPasswordViewState
    extends State<LineSkipperResetPasswordView> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController reEnterNewPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(translate(context, 'manage_account'),
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              CustomTextField(
                controller: currentPasswordController,
                obscureText: true,
                labelText: translate(context, 'enter_current_password'),
                labelStyle: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              const SizedBox(height: 16),
              BlocBuilder<LineSkipperManageAccountCubit,
                      LineSkipperManageAccountState>(
                  buildWhen: (previous, current) =>
                      previous.isNewPasswordObscure !=
                      current.isNewPasswordObscure,
                  builder: (context, state) {
                    return CustomTextField(
                      controller: newPasswordController,
                      obscureText: state.isNewPasswordObscure,
                      labelText: translate(context, 'new_password'),
                      labelStyle: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<LineSkipperManageAccountCubit>()
                                .toggleNewPassword();
                          },
                          child: Text(
                            translate(
                                context,
                                state.isNewPasswordObscure
                                    ? 'show_password'
                                    : 'hide_password'),
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ),
                      ),
                    );
                  }),
              const SizedBox(height: 16),
              BlocBuilder<LineSkipperManageAccountCubit,
                      LineSkipperManageAccountState>(
                  buildWhen: (previous, current) =>
                      previous.isReEnterNewPasswordObsure !=
                      current.isReEnterNewPasswordObsure,
                  builder: (context, state) {
                    return CustomTextField(
                      controller: reEnterNewPasswordController,
                      labelText: translate(context, 're_enter_new_password'),
                      obscureText: state.isReEnterNewPasswordObsure,
                      labelStyle: LineItUpTextTheme().body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: GestureDetector(
                          onTap: () {
                            context
                                .read<LineSkipperManageAccountCubit>()
                                .toggleReEnterNewPassword();
                          },
                          child: Text(
                            translate(
                                context,
                                state.isReEnterNewPasswordObsure
                                    ? 'show_password'
                                    : 'hide_password'),
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 14,
                                ),
                          ),
                        ),
                      ),
                    );
                  }),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onTap: () {
                    context
                        .pushPage(const LineSkipperResetPasswordSuccessPage());
                  },
                  title: translate(context, 'reset_password'),
                ),
              )
            ],
          ),
        ));
  }
}
