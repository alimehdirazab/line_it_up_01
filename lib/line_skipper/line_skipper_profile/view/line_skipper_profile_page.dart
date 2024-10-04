part of 'view.dart';

class LineSkipperProfilePage extends StatelessWidget {
  const LineSkipperProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LineSkipperProfileView();
  }
}

class LineSkipperProfileView extends StatelessWidget {
  const LineSkipperProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 76),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(translate(context, 'profile'),
                    style: LineItUpTextTheme()
                        .body
                        .copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 24),
                Image.asset(LineItUpImages.manAvatar1),
                const SizedBox(height: 12),
                Text('Alex William', style: LineItUpTextTheme().body),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () {
                    context.pushPage(const LineSkipperManageAccountPage());
                  },
                  child: Text(translate(context, 'manage_account'),
                      style: LineItUpTextTheme().body.copyWith(
                            color: LineItUpColorTheme().grey60,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                ),
                const SizedBox(height: 36),
              ],
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _totalStatsCard(
                        title: translate(context, 'total_orders'),
                        value: '250',
                      ),
                      _totalStatsCard(
                        title: translate(context, 'ratings'),
                        value: '4.8',
                      ),
                      _totalStatsCard(
                        title: translate(context, 'time_duration'),
                        value: '6 mo',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    thickness: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        _profileListTile(
                          title: translate(context, 'wallet'),
                          subtitle: translate(context, 'manage_your_wallet'),
                          divider: true,
                          onTap: () {
                            context.pushPage(const LineSkipperWalletPage());
                          },
                        ),
                        _profileListTile(
                          onTap: () {
                            context.pushPage(const LineSkipperStatisticsPage());
                          },
                          title: translate(context, 'statistics'),
                          subtitle: translate(
                              context, 'get_your_overall_performance_stats'),
                          divider: true,
                        ),
                        _profileListTile(
                          onTap: () {
                            context.pushPage(const LineSkipperQrCodePage());
                          },
                          title: 'QR Code',
                          subtitle:
                              translate(context, 'scan_for_your_information'),
                          divider: true,
                        ),
                        _profileListTile(
                          onTap: () {
                            context
                                .pushPage(const LineSkipperPrivacyPolicyPage());
                          },
                          title: translate(context, 'privacy_policy'),
                          subtitle: translate(
                              context, 'learn_about_privacy_and_account'),
                          divider: true,
                        ),
                        _profileListTile(
                          title: translate(context, 'push_notification'),
                          trailing: Switch(
                            value: true,
                            onChanged: (value) {},
                            activeColor: LineItUpColorTheme().green,
                            activeTrackColor: LineItUpColorTheme().grey40,
                            inactiveTrackColor: LineItUpColorTheme().grey40,
                            inactiveThumbColor: LineItUpColorTheme().grey,
                          ),
                          divider: true,
                        ),
                        BlocBuilder<LineSkipperHomeCubit, LineSkipperHomeState>(
                            buildWhen: (previous, current) =>
                                previous.status != current.status,
                            builder: (context, state) {
                              return _profileListTile(
                                title: translate(context, 'status'),
                                trailing: Switch(
                                  value:
                                      state.status == LineSkipperStatus.online,
                                  onChanged: (value) {
                                    context
                                        .read<LineSkipperHomeCubit>()
                                        .toggleLineSkipperStatus();
                                  },
                                  activeColor: LineItUpColorTheme().green,
                                  activeTrackColor: LineItUpColorTheme().grey40,
                                  inactiveTrackColor:
                                      LineItUpColorTheme().grey40,
                                  inactiveThumbColor: LineItUpColorTheme().grey,
                                  trackOutlineColor: WidgetStateProperty.all(
                                      LineItUpColorTheme().grey40),
                                  trackOutlineWidth:
                                      const WidgetStatePropertyAll(0),
                                ),
                                status: state.status == LineSkipperStatus.online
                                    ? translate(context, 'online')
                                    : translate(context, 'offline'),
                                statusColor:
                                    state.status == LineSkipperStatus.online
                                        ? LineItUpColorTheme().green
                                        : LineItUpColorTheme().red,
                              );
                            }),
                        SizedBox(
                          width: double.infinity,
                          child: CustomElevatedButton(
                            title: 'Logout',
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => Dialog(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const SizedBox(height: 16),
                                              Text(translate(context, 'logout'),
                                                  style: LineItUpTextTheme()
                                                      .body
                                                      .copyWith(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color:
                                                            LineItUpColorTheme()
                                                                .red,
                                                      )),
                                              const SizedBox(height: 14),
                                              Text(
                                                  translate(context,
                                                      'are_you_sure_you_want_to_logout_this_account'),
                                                  style: LineItUpTextTheme()
                                                      .body
                                                      .copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )),
                                              const SizedBox(height: 25),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        context.mWidth * 0.32,
                                                    child: CustomElevatedButton(
                                                      title: translate(
                                                          context, 'no'),
                                                      onTap: () {
                                                        context.popPage();
                                                      },
                                                      buttonColor:
                                                          LineItUpColorTheme()
                                                              .grey20,
                                                      fontColor:
                                                          LineItUpColorTheme()
                                                              .black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        context.mWidth * 0.32,
                                                    child: CustomElevatedButton(
                                                      title: translate(
                                                          context, 'yes'),
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _totalStatsCard({required String title, required String value}) {
    return Column(
      children: [
        Text(value,
            style: LineItUpTextTheme().body.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: LineItUpColorTheme().grey)),
        const SizedBox(height: 8),
        Text(title,
            style: LineItUpTextTheme().body.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                )),
      ],
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
