part of 'widgets.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTapHome,
    required this.onTapOrders,
    required this.onTapProfile,
  });

  final int currentIndex;
  final VoidCallback onTapHome;
  final VoidCallback onTapOrders;
  final VoidCallback onTapProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: Platform.isIOS ? 16 : 0),
      decoration: BoxDecoration(
        color: LineItUpColorTheme().white,
        border: Border(
          top: BorderSide(
            color: LineItUpColorTheme().grey20.withOpacity(0.3),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _BottomNavBarItem(
            icon: LineItUpIcons().home,
            isSelected: 0 == currentIndex,
            label: translate(context, 'home'),
            onTap: onTapHome,
          ),
          _BottomNavBarItem(
            icon: LineItUpIcons().orders,
            isSelected: 1 == currentIndex,
            label: translate(context, 'orders'),
            onTap: onTapOrders,
          ),
          _BottomNavBarItem(
            icon: LineItUpIcons().profile,
            isSelected: 2 == currentIndex,
            label: translate(context, 'profile'),
            onTap: onTapProfile,
          ),
        ],
      ),
    );
  }
}

class _BottomNavBarItem extends StatelessWidget {
  const _BottomNavBarItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.label,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Opacity(
            opacity: isSelected ? 1 : 0.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                isSelected
                    ? Icon(
                        icon,
                        color: LineItUpColorTheme().primary,
                        size: 28,
                      )
                    : Icon(
                        icon,
                        color: LineItUpColorTheme().grey,
                        size: 28,
                      ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: LineItUpTextTheme().body.copyWith(
                        color: isSelected
                            ? LineItUpColorTheme().primary
                            : LineItUpColorTheme().grey,
                        fontSize: 12,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
