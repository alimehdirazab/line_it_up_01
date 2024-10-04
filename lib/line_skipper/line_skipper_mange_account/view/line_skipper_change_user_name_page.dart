part of 'view.dart';

class LineSkipperChangeUserNamePage extends StatelessWidget {
  const LineSkipperChangeUserNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LineSkipperChangeUserNameView();
  }
}

class LineSkipperChangeUserNameView extends StatefulWidget {
  const LineSkipperChangeUserNameView({super.key});

  @override
  State<LineSkipperChangeUserNameView> createState() =>
      _LineSkipperChangeUserNameViewState();
}

class _LineSkipperChangeUserNameViewState
    extends State<LineSkipperChangeUserNameView> {
  TextEditingController userNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userNameController.text = 'James Andrew';
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
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 16),
          child: Column(
            children: [
              CustomTextField(
                labelText: translate(context, 'user_name'),
                labelStyle: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                controller: userNameController,
                suffixIcon: Icon(LineItUpIcons().rightArrow),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  onTap: () {
                    context.popPage();
                  },
                  title: translate(context, 'save'),
                ),
              )
            ],
          ),
        ));
  }
}
