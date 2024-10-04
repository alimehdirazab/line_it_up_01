part of 'widgets.dart';

class CircleStoreCard extends StatelessWidget {
  final String image;
  final String name;
  final String time;
  final bool isClosed;
  final void Function()? onTap;
  const CircleStoreCard({
    super.key,
    required this.image,
    required this.name,
    required this.time,
    this.isClosed = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  border: Border.all(color: LineItUpColorTheme().grey20),
                  borderRadius: BorderRadius.circular(40)),
              child: Image.asset(
                image,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              name,
              style: LineItUpTextTheme().body.copyWith(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text('${translate(context, 'by')} $time',
                style: LineItUpTextTheme().body.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: isClosed
                        ? LineItUpColorTheme().grey
                        : LineItUpColorTheme().green)),
          ],
        ),
      ),
    );
  }
}
