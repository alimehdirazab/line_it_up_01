part of 'widgets.dart';

class CategoryCard extends StatelessWidget {
  final String categoryText;
  final String categoryImage;
  final bool? isSelected;
  final void Function()? onTap;
  const CategoryCard({
    super.key,
    required this.categoryText,
    required this.categoryImage,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: isSelected!
              ? LineItUpColorTheme().grey20
              : LineItUpColorTheme().white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(categoryImage),
            const SizedBox(height: 2),
            Text(
              categoryText,
              style: LineItUpTextTheme()
                  .body
                  .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
