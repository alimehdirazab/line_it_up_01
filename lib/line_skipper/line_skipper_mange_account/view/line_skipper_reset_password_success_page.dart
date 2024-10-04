part of 'view.dart';

class LineSkipperResetPasswordSuccessPage extends StatelessWidget {
  const LineSkipperResetPasswordSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LineSkipperResetPasswordSuccessView();
  }
}

class LineSkipperResetPasswordSuccessView extends StatelessWidget {
  const LineSkipperResetPasswordSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(LineItUpImages.checkVerified),
            const SizedBox(height: 18),
            Text(translate(context, 'password_reset_successfully'),
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 20,
                    )),
          ],
        ),
      ),
    );
  }
}
