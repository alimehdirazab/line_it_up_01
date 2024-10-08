part of 'widgets.dart';

class CustomCardWidget extends StatelessWidget {
  final String? category;
  final String? status;
  final String? cost;
  final IconData? icon;
  final String? estimatedAndStatus;
  final VoidCallback? onPressed;

  const CustomCardWidget(
      {super.key,
      this.category,
      this.status,
      this.icon,
      this.cost,
      this.estimatedAndStatus,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
        color: LineItUpColorTheme().grey20,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: context.mHeight * 0.15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: const GoogleMap(
                myLocationButtonEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.42796133580664, -122.085749655962),
                  zoom: 14.4746,
                ),
                mapType: MapType.normal,
                zoomControlsEnabled: false,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(category!,
              style: LineItUpTextTheme().body.copyWith(
                    color: LineItUpColorTheme().grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  )),
          const SizedBox(height: 4),
          Text(status!,
              style: LineItUpTextTheme()
                  .body
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 16)),
          const SizedBox(height: 4),
          if (cost != null)
            Text(
              '\$$cost',
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: LineItUpColorTheme().grey,
                  ),
            ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Icon(
                icon!,
                size: 20,
                color: LineItUpColorTheme().primary,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(estimatedAndStatus!,
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: LineItUpColorTheme().primary,
                      )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: LineItUpColorTheme().grey20,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomElevatedButton(
            width: double.infinity,
            title: translate(context, 'view_order'),
            onTap: onPressed,
          ),
        ],
      ),
    );
  }
}
