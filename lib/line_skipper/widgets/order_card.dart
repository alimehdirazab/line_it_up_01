part of 'widgets.dart';

class OrderCard extends StatefulWidget {
  final String storeName;
  final String storeAddress;
  final double distance;
  final double estimatedCost;
  final List<String> orders;
  final bool showMap;
  final bool viewOrderButton;
  final bool acceptOrderButton;
  final bool rejectOrderButton;
  final void Function()? onViewOrderTap;
  final void Function()? onAcceptOrderTap;
  final void Function()? onRejectOrderTap;

  const OrderCard({
    super.key,
    required this.orders,
    this.viewOrderButton = false,
    this.acceptOrderButton = false,
    this.rejectOrderButton = false,
    required this.storeName,
    required this.storeAddress,
    required this.distance,
    required this.estimatedCost,
    this.showMap = false,
    this.onViewOrderTap,
    this.onAcceptOrderTap,
    this.onRejectOrderTap,
  });

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool showOrderList = false;
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
          widget.showMap
              ? SizedBox(
                  width: double.infinity,
                  height: context.mHeight * 0.15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
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
                )
              : const SizedBox(height: 0),
          const SizedBox(height: 14),
          Text(widget.storeName,
              style: LineItUpTextTheme()
                  .body
                  .copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(widget.storeAddress,
                  style: LineItUpTextTheme().body.copyWith(
                        color: LineItUpColorTheme().grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
              const SizedBox(width: 7),
              Text('.', style: LineItUpTextTheme().body),
              const SizedBox(width: 7),
              Text('${widget.distance} mi',
                  style: LineItUpTextTheme().body.copyWith(
                        color: LineItUpColorTheme().grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
            ],
          ),
          const SizedBox(height: 8),
          Text('Est. cost, \$${widget.estimatedCost}',
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )),
          const SizedBox(height: 12),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(translate(context, 'order_list'),
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      showOrderList = !showOrderList;
                    });
                  },
                  icon: Icon(
                    showOrderList
                        ? LineItUpIcons().downArrow
                        : LineItUpIcons().upArrow,
                    color: LineItUpColorTheme().black,
                  ))
            ],
          ),
          if (showOrderList)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.orders
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: Text(e,
                            style: LineItUpTextTheme().body.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: LineItUpColorTheme().grey,
                                )),
                      ))
                  .toList(),
            ),
          const SizedBox(height: 10),
          if (widget.viewOrderButton)
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                title: translate(context, 'view_order'),
                onTap: widget.onViewOrderTap,
              ),
            ),
          if (widget.acceptOrderButton)
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                title: translate(context, 'accept_order'),
                onTap: widget.onAcceptOrderTap,
              ),
            ),
          if (widget.rejectOrderButton)
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                title: translate(context, 'reject_order'),
                onTap: widget.onRejectOrderTap,
                buttonColor: LineItUpColorTheme().transparent,
                fontColor: LineItUpColorTheme().red,
                fontSize: 14,
              ),
            ),
        ],
      ),
    );
  }
}
