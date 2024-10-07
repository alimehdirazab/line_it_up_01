part of 'view.dart';

class UserSearchSomeWhereElsePage extends StatelessWidget {
  const UserSearchSomeWhereElsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _UserSearchSomeWhereElseView();
  }
}

class _UserSearchSomeWhereElseView extends StatelessWidget {
  const _UserSearchSomeWhereElseView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.popPage();
          },
          icon: Icon(
            LineItUpIcons().cross,
            color: LineItUpColorTheme().black,
            size: 24,
          ),
        ),
        title: Text(
          translate(context, 'select_location'),
          style: LineItUpTextTheme().body.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: CustomTextField(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                hintText: '12348 street, LA',
                hintStyle: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                prefixIcon: Icon(
                  LineItUpIcons().search,
                  color: LineItUpColorTheme().black10,
                  size: 24,
                ),
                filled: true,
                fillColor: LineItUpColorTheme().grey20,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Flexible(
            child: Stack(
              alignment: Alignment.bottomCenter,
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                  child: CustomElevatedButton(
                      onTap: () {
                        context.popPage();
                      },
                      width: double.infinity,
                      title: translate(context, 'confirm')),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
