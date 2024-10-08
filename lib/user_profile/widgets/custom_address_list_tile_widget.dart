part of "widgets.dart";

class AddressListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;
  final VoidCallback? onTap;

  const AddressListTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: LineItUpColorTheme().black,
            size: 24,
          ),
          title: Text(
            title,
            style: LineItUpTextTheme().body.copyWith(
                  fontSize: 14,
                  color: LineItUpColorTheme().black,
                  fontWeight: FontWeight.w500,
                ),
          ),
          subtitle: Text(
            subtitle,
            style: LineItUpTextTheme().body.copyWith(
                  fontSize: 12,
                  color: LineItUpColorTheme().grey,
                  fontWeight: FontWeight.w500,
                ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: LineItUpColorTheme().black,
            size: 16,
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
