part of 'view.dart';

class LineSkipperOrderAcceptedPage extends StatelessWidget {
  const LineSkipperOrderAcceptedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LIneSkipperOrderAcceptedView();
  }
}

class LIneSkipperOrderAcceptedView extends StatelessWidget {
  const LIneSkipperOrderAcceptedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const GoogleMap(
          myLocationButtonEnabled: false,
          initialCameraPosition: CameraPosition(
            target: LatLng(37.42796133580664, -122.085749655962),
            zoom: 14.4746,
          ),
          mapType: MapType.normal,
          zoomControlsEnabled: false,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
            width: double.infinity,
            height: context.mHeight * 0.37,
            decoration: BoxDecoration(
              color: LineItUpColorTheme().white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2 min',
                          style: LineItUpTextTheme().body.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: LineItUpColorTheme().primary,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              '350 m',
                              style: LineItUpTextTheme().body.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: LineItUpColorTheme().grey,
                                  ),
                            ),
                            const SizedBox(width: 8),
                            Text('.', style: LineItUpTextTheme().body),
                            const SizedBox(width: 8),
                            Text(
                              '06:30pm',
                              style: LineItUpTextTheme().body.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: LineItUpColorTheme().grey,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    CircleButton(
                      icon: LineItUpIcons().phone1,
                      backgroundColor: LineItUpColorTheme().grey20,
                      radius: 32,
                    ),
                    const SizedBox(width: 10),
                    CircleButton(
                      icon: LineItUpIcons().message,
                      backgroundColor: LineItUpColorTheme().grey20,
                      radius: 32,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  decoration: BoxDecoration(
                    color: LineItUpColorTheme().grey20,
                    border: Border.all(
                      color: LineItUpColorTheme().grey50,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(LineItUpIcons().infomsg,
                          color: LineItUpColorTheme().black),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                            translate(context,
                                'you_have_to_notify_user_when_you_reached_to_your_destination'),
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                    onTap: () {
                      context.pushPage(const LineSkipperWaitingInQueuePage());
                    },
                    title: translate(context, 'start_order'),
                    padding: const EdgeInsets.all(17),
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: LineItUpColorTheme().white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(LineItUpIcons().turnRight,
                        color: LineItUpColorTheme().primary, size: 40),
                    const SizedBox(width: 16),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '600m',
                          style: LineItUpTextTheme().heading.copyWith(
                                fontSize: 27,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'In 500m take turning right',
                          style: LineItUpTextTheme().body.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: LineItUpColorTheme().grey,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CircleButton(
                icon: LineItUpIcons().cross,
                onPressed: () {
                  context.popPage();
                },
              ),
            ],
          ),
        )
      ],
    ));
  }
}
