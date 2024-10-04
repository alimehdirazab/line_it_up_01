part of 'view.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _NotificationView();
  }
}

class _NotificationView extends StatelessWidget {
  const _NotificationView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate(context, 'notifications'),
          style: LineItUpTextTheme().body.copyWith(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
            onPressed: () {
              context.popPage();
            },
            icon: Icon(
              LineItUpIcons().backArrow,
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NotificationCard(
            image: LineItUpImages.store1,
            text:
                'Get 10% off on all Cost Less Food Company items on this charismas eve. ',
            time: '1 min ago',
            isReaded: true,
          ),
          const Divider(),
          const NotificationCard(
            image: LineItUpImages.store1,
            text:
                'Get 10% off on all Cost Less Food Company items on this charismas eve. ',
            time: '1 hr ago',
            isReaded: true,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
            child: Text(
              translate(context, 'yesterday'),
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
          const NotificationCard(
              image: LineItUpImages.store1,
              text:
                  'Get 10% off on all Cost Less Food Company items on this charismas eve. ',
              time: '1 day ago'),
        ],
      ),
    );
  }
}
