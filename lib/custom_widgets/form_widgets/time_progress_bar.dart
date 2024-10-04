part of '../../user_line_skipper/widgets/widgets.dart';

class TimeProgressBar extends StatelessWidget {
  final int currentIndex; // Takes the index as a parameter
  final int totalIndex;

  const TimeProgressBar({
    super.key,
    required this.currentIndex,
    this.totalIndex = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(totalIndex, (index) {
        return Container(
          width: context.mWidth / totalIndex * 0.87,
          height: context.mHeight * 0.005,
          decoration: BoxDecoration(
            color: index < currentIndex
                ? LineItUpColorTheme().green // Green for indices < currentIndex
                : LineItUpColorTheme().grey10, // Gray for other indices
            borderRadius: BorderRadius.circular(1),
          ),
        );
      }),
    );
  }
}
