part of 'widgets.dart';

class TransactionTile extends StatelessWidget {
  final String paymetMehtodLogoUrl;
  final String name;
  final String date;
  final String storeName;
  final double transaction;
  const TransactionTile(
      {super.key,
      required this.paymetMehtodLogoUrl,
      required this.name,
      required this.date,
      required this.storeName,
      required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: LineItUpColorTheme().grey20,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Image.asset(paymetMehtodLogoUrl),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    )),
            const SizedBox(height: 4),
            Text(date,
                style: LineItUpTextTheme().body.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: LineItUpColorTheme().grey)),
            const SizedBox(height: 4),
            Text(storeName,
                style: LineItUpTextTheme().body.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: LineItUpColorTheme().grey))
          ],
        ),
        const Spacer(),
        Text('+\$$transaction',
            style: LineItUpTextTheme().body.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: LineItUpColorTheme().primary)),
      ],
    );
  }
}
