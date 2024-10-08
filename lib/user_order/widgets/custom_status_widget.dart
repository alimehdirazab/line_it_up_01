part of 'widgets.dart';

class CustomStatusWidget extends StatelessWidget {
  final String shopName;
  final String date;
  final String cost;
  final String estimatedTime;
  final bool showDivider;

  const CustomStatusWidget({
    super.key,
    required this.cost,
    required this.date,
    required this.estimatedTime,
    required this.shopName,
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          translate(context, 'completed'),
          style: LineItUpTextTheme()
              .body
              .copyWith(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          shopName,
          style: LineItUpTextTheme()
              .body
              .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "$date • \$$cost • $estimatedTime",
          style: LineItUpTextTheme().body.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: LineItUpColorTheme().grey),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomElevatedButton(
              title: 'View recipt',
              buttonColor: LineItUpColorTheme().grey,
              fontSize: 14,
              width: context.mWidth * 0.43,
              fontWeight: FontWeight.w500,
            ),
            CustomElevatedButton(
                title: 'Reorder',
                buttonColor: LineItUpColorTheme().grey,
                fontSize: 14,
                width: context.mWidth * 0.43,
                fontWeight: FontWeight.w500),
          ],
        ),
        if (showDivider)
          const SizedBox(
            height: 24,
          ),
        Divider(
          color: LineItUpColorTheme().grey20,
        ),
      ],
    );
  }
}
