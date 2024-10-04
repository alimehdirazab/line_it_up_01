part of 'view.dart';

class FindingLineSkipperPage extends StatelessWidget {
  const FindingLineSkipperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FindingLineSkipperPageView();
  }
}

class FindingLineSkipperPageView extends StatefulWidget {
  const FindingLineSkipperPageView({super.key});

  @override
  State<FindingLineSkipperPageView> createState() =>
      _FindingLineSkipperPageViewState();
}

class _FindingLineSkipperPageViewState
    extends State<FindingLineSkipperPageView> {
  bool isReaching = false;

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
          Positioned(
            bottom: context.mHeight * 0.80,
            left: context.mWidth * 0.05,
            child: Row(
              children: [
                Column(
                  children: [
                    _buildLocationCard(
                      context,
                      translate(context, 'from'),
                      '12348 street, LA',
                      LineItUpColorTheme().red,
                    ),
                    SizedBox(height: context.mHeight * 0.01),
                    _buildLocationCard(
                      context,
                      translate(context, 'pick'),
                      'Cost Less Foods',
                      LineItUpColorTheme().green,
                    ),
                  ],
                ),
                SizedBox(width: context.mWidth * 0.15),
                CircleButton(
                  icon: LineItUpIcons().cross,
                  onPressed: () {
                    context.popPage();
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: isReaching
                ? _reachingBottomContainer(context)
                : _connectingBottomContainer(context),
          )
        ],
      ),
    );
  }

  Widget _buildLocationCard(
      BuildContext context, String title, String subtitle, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(15.6),
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          child: Text(
            title,
            style: LineItUpTextTheme()
                .body
                .copyWith(color: LineItUpColorTheme().white, fontSize: 12),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(14),
          width: context.mWidth * 0.46,
          decoration: BoxDecoration(
              color: LineItUpColorTheme().white,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  subtitle,
                  style: LineItUpTextTheme().body.copyWith(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _reachingBottomContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      height: context.mHeight * 0.40,
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translate(context, 'line_skipper_reaching_in'),
                style: LineItUpTextTheme()
                    .body
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                '3:45 min',
                style: LineItUpTextTheme()
                    .body
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          Row(
            children: [
              Image.asset(LineItUpImages.manAvatar),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sam Karen',
                      style: LineItUpTextTheme()
                          .body
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w600)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '4.5',
                        style: LineItUpTextTheme().body.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: LineItUpColorTheme().grey,
                            ),
                      ),
                      const SizedBox(width: 4.5),
                      Icon(
                        LineItUpIcons().star,
                        color: LineItUpColorTheme().yellow,
                        size: 18,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: LineItUpColorTheme().grey20,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: LineItUpColorTheme().grey50),
            ),
            child: Row(
              children: [
                Icon(LineItUpIcons().infomsg,
                    color: LineItUpColorTheme().black),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                      translate(context,
                          'the_line_skipper_will_contact_you_before_he_joins_the_queue_to_confirm_the_order'),
                      style: LineItUpTextTheme().body.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: LineItUpColorTheme().black)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: context.mWidth * 0.55,
                child: CustomElevatedButton(
                  onTap: () {
                    context.pushPage(const FindingOrderPage());
                  },
                  title: translate(context, 'continue'),
                  padding: const EdgeInsets.all(17),
                ),
              ),
              CircleButton(
                icon: LineItUpIcons().phone1,
                onPressed: () {},
                backgroundColor: LineItUpColorTheme().grey20,
                radius: 27,
              ),
              CircleButton(
                icon: LineItUpIcons().message,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: LineItUpColorTheme().white,
                    builder: (context) {
                      return const ChatBottomSheet();
                    },
                  );
                },
                backgroundColor: LineItUpColorTheme().grey20,
                radius: 27,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _connectingBottomContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      height: context.mHeight * 0.35,
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
          Text(
            translate(context, 'connecting_you_to_line_skipper'),
            style: LineItUpTextTheme()
                .body
                .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Text(
                translate(context, 'connecting_in'),
                style: LineItUpTextTheme().body.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: LineItUpColorTheme().grey),
              ),
              const SizedBox(width: 4),
              Text(
                '30 Sec',
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: LineItUpColorTheme().grey,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: 0.3,
            backgroundColor: LineItUpColorTheme().grey20,
            valueColor:
                AlwaysStoppedAnimation<Color>(LineItUpColorTheme().primary),
          ),
          const SizedBox(height: 24),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isReaching = true;
                });
              },
              child: Image.asset(LineItUpImages.manAvatar1),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBottomSheet extends StatelessWidget {
  const ChatBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.mHeight * 0.87,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ), // Adjust the padding dynamically with keyboard height
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.popPage();
                    },
                    icon: Icon(LineItUpIcons().cross),
                    color: LineItUpColorTheme().black,
                  ),
                  Image.asset(LineItUpImages.manAvatar, width: 31, height: 32),
                  SizedBox(width: context.mWidth * 0.02),
                  Text(
                    'Sam Karen',
                    style: LineItUpTextTheme()
                        .body
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  CircleButton(
                    icon: LineItUpIcons().phone1,
                    backgroundColor: LineItUpColorTheme().grey20,
                    radius: 27,
                  )
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildFastChatChip('hello', () {}),
                  _buildFastChatChip('Thank You', () {}),
                ],
              ),
              SizedBox(height: context.mHeight * 0.01),
              const Divider(),
              CustomTextField(
                hintText: translate(context, 'type_your_message'),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(LineItUpIcons().send),
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              )
            ],
          ),
        ));
  }

  Widget _buildFastChatChip(String text, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: LineItUpColorTheme().grey20,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Text(text,
              style: LineItUpTextTheme()
                  .body
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
