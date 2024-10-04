part of 'widgets.dart';

class PopularSpotsCard extends StatelessWidget {
  final String image;
  final String spotName;
  final String time;
  const PopularSpotsCard({
    super.key,
    required this.image,
    required this.spotName,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(image),
        ),
        const SizedBox(height: 8),
        Text(
          spotName,
          style: LineItUpTextTheme().body.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
        ),
        Text(
          time,
          style: LineItUpTextTheme().body.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: LineItUpColorTheme().grey,
              ),
        ),
      ],
    );
  }
}
