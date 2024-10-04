part of 'view.dart';

class LineSkipperManageAccountPage extends StatelessWidget {
  const LineSkipperManageAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LineSkipperManageAccountView();
  }
}

class LineSkipperManageAccountView extends StatefulWidget {
  const LineSkipperManageAccountView({super.key});

  @override
  State<LineSkipperManageAccountView> createState() =>
      _LineSkipperManageAccountViewState();
}

class _LineSkipperManageAccountViewState
    extends State<LineSkipperManageAccountView> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  initState() {
    super.initState();
    userNameController.text = 'James Andrew';
    emailController.text = 'jamesandrew@gmail.com';
    phoneNumberController.text = '+1 08083802802803';
    passwordController.text = '**************';
  }

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
                onTap: () {
                  context.pushPage(const LineSkipperChangeUserNamePage());
                },
                labelText: translate(context, 'user_name'),
                labelStyle: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                controller: userNameController,
                readOnly: true,
                suffixIcon: Icon(LineItUpIcons().rightArrow),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: emailController,
                readOnly: true,
                labelText: translate(context, 'email'),
                labelStyle: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                contentStyle: LineItUpTextTheme().body.copyWith(
                      color: LineItUpColorTheme().grey60.withOpacity(0.4),
                    ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: phoneNumberController,
                readOnly: true,
                labelText: translate(context, 'phone_number'),
                labelStyle: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                contentStyle: LineItUpTextTheme().body.copyWith(
                      color: LineItUpColorTheme().grey60.withOpacity(0.4),
                    ),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                onTap: () {
                  context.pushPage(const LineSkipperResetPasswordPage());
                },
                controller: passwordController,
                readOnly: true,
                labelText: translate(context, 'password'),
                labelStyle: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    translate(context, 'reset_password'),
                    style: LineItUpTextTheme().body.copyWith(
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
