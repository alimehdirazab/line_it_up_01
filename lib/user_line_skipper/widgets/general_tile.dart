part of 'widgets.dart';

class GeneralTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String subtitle;
  final IconData? trailing;
  final void Function()? onTap;
  const GeneralTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: LineItUpColorTheme().grey20,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: LineItUpColorTheme().black,
              size: 24,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: LineItUpColorTheme().grey,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              trailing,
              color: LineItUpColorTheme().black,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
