part of 'widgets.dart';

class NotificationCard extends StatelessWidget {
  final String image;
  final String text;
  final String time;
  final bool isReaded;
  const NotificationCard({
    super.key,
    required this.image,
    required this.text,
    required this.time,
    this.isReaded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: isReaded ? LineItUpColorTheme().grey20 : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                color: LineItUpColorTheme().background,
                border: Border.all(color: LineItUpColorTheme().grey20),
                borderRadius: BorderRadius.circular(4)),
            child: Image.asset(
              image,
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  time,
                  style: LineItUpTextTheme().body.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: LineItUpColorTheme().grey10),
                )
                
              ],
            ),
          )

        ],
      ),
    );
  }
}
