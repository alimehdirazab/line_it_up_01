part of 'view.dart';

class ConfirmLocationPage extends StatelessWidget {
  const ConfirmLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConfirmLoactionView();
  }
}

class ConfirmLoactionView extends StatelessWidget {
  const ConfirmLoactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate(context, 'confirm_location'),
          style: LineItUpTextTheme().body.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        centerTitle: true,
      ),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              width: double.infinity,
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
                  Text(translate(context, 'confirm_location'),
                      style: LineItUpTextTheme()
                          .body
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 16),
                  GeneralTile(
                    icon: LineItUpIcons().location,
                    title: translate(context, 'ordering_from'),
                    subtitle: '12348 street, LA',
                    trailing: LineItUpIcons().edit,
                  ),
                  const SizedBox(height: 12),
                  GeneralTile(
                    icon: LineItUpIcons().phone,
                    title: translate(context, 'receiver_contact'),
                    subtitle: '080803280208',
                    trailing: LineItUpIcons().edit,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      onTap: () {
                        context.pushPage(const OrderListPage());
                      },
                      title: translate(context, 'continue'),
                      padding: const EdgeInsets.all(17),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: context.mHeight * 0.80,
            left: context.mWidth * 0.08,
            child: _buildLocationCard(
              translate(context, 'pick'),
              'Cost Less Foods',
              LineItUpColorTheme().green,
            ),
          ),
          Positioned(
            bottom: context.mHeight * 0.50,
            left: context.mWidth * 0.4,
            child: _buildLocationCard(
              translate(context, 'from'),
              '12348 street, LA',
              LineItUpColorTheme().red,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLocationCard(String title, String subtitle, Color color) {
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
          width: 130,
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
              Icon(
                LineItUpIcons().edit,
                color: LineItUpColorTheme().black,
                size: 17,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
