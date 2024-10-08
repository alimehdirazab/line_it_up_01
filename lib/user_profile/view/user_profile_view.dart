part of 'view.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProfileCubit(),
      child: const _UserProfileView(),
    );
  }
}

class _UserProfileView extends StatelessWidget {
  const _UserProfileView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          translate(context, 'profile'),
          style: LineItUpTextTheme().body.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _profileListTile(
              title: translate(context, 'manage_account'),
              subtitle: translate(context, 'manage_your_personal_information'),
              divider: true,
              onTap: () {
                context.pushPage(const LineSkipperManageAccountPage());
              },
            ),
            _profileListTile(
              title: translate(context, 'saved_products'),
              subtitle: translate(context, 'heart_the_favourite'),
              divider: true,
              onTap: () {
                context.pushPage(const UserProfileSavedProductsPage());
              },
            ),
            _profileListTile(
              title: translate(context, 'payment'),
              subtitle: translate(context, 'manage_payment_method'),
              divider: true,
              onTap: () {
                context.pushPage(const UserProfileSavedPaymentMethodPage());
              },
            ),
            _profileListTile(
              title: translate(context, 'addresses'),
              subtitle: translate(context, 'add_or_remove_a_delivery_address'),
              divider: true,
              onTap: () {
                context.pushPage(const UserProfileAddressMainPage());
              },
            ),
            _profileListTile(
              title: translate(context, 'push_notification'),
              trailing: BlocBuilder<UserProfileCubit, UserProfileState>(
                builder: (context, state) {
                  return Switch(
                    value: state.isNotificationButtonEnabled,
                    onChanged: (value) {
                      context
                          .read<UserProfileCubit>()
                          .toggleNotificationButton();
                    },
                    activeColor: LineItUpColorTheme().primary,
                    inactiveTrackColor: LineItUpColorTheme().grey80,
                    inactiveThumbColor: Colors.green,
                    activeTrackColor: LineItUpColorTheme().grey80,
                    trackOutlineColor: WidgetStateProperty.all(Colors.white),
                  );
                },
              ),
              divider: true,
              onTap: null, // No tap needed for toggle
            ),
            _profileListTile(
              title: translate(context, 'privacy_policy'),
              subtitle: translate(context, 'learn_about_privacy_and_account'),
              divider: true,
              onTap: () {
                context.pushPage(const LineSkipperPrivacyPolicyPage());
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                title: 'Logout',
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => Dialog(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 16),
                                  Text(translate(context, 'logout'),
                                      style: LineItUpTextTheme().body.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: LineItUpColorTheme().red,
                                          )),
                                  const SizedBox(height: 14),
                                  Text(
                                      translate(context,
                                          'are_you_sure_you_want_to_logout_this_account'),
                                      style: LineItUpTextTheme().body.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          )),
                                  const SizedBox(height: 25),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: context.mWidth * 0.32,
                                        child: CustomElevatedButton(
                                          title: translate(context, 'no'),
                                          onTap: () {
                                            context.popPage();
                                          },
                                          buttonColor:
                                              LineItUpColorTheme().grey20,
                                          fontColor: LineItUpColorTheme().black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: context.mWidth * 0.32,
                                        child: CustomElevatedButton(
                                          title: translate(context, 'yes'),
                                          onTap: () {
                                            context.popPage();
                                            context.pushAndRemoveUntilPage(
                                                const LoginPage());
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            ),
                          ));
                },
                buttonColor: LineItUpColorTheme().red,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _profileListTile(
      {required String title,
      String? subtitle,
      Widget? trailing,
      String? status,
      Color? statusColor,
      bool divider = false,
      void Function()? onTap}) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          title: Row(
            children: [
              Text(title,
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )),
              if (status != null) ...[
                const SizedBox(width: 5),
                Text(status,
                    style: LineItUpTextTheme().body.copyWith(
                          color: statusColor ?? LineItUpColorTheme().primary,
                          fontWeight: FontWeight.w600,
                        )),
              ]
            ],
          ),
          subtitle: subtitle != null
              ? Text(subtitle,
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: LineItUpColorTheme().grey60,
                      ))
              : const SizedBox(),
          trailing: trailing ??
              Icon(
                Icons.arrow_forward_ios,
                color: LineItUpColorTheme().black,
                size: 16,
              ),
          onTap: onTap,
        ),
        if (divider) const Divider(),
      ],
    );
  }
}
