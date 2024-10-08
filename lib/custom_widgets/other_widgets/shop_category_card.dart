part of 'other_widgets.dart';

class ShopCategoryCard extends StatelessWidget {
  final String categoryText;
  final String categoryImage;
  final bool? isSelected;
  final void Function()? onTap;
  const ShopCategoryCard({
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
      child: SizedBox(
        width: 84,
        height: 120,
        child: Column(
          children: [
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: isSelected!
                    ? LineItUpColorTheme().grey20
                    : LineItUpColorTheme().white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(categoryImage, width: 40, height: 40),
                  const SizedBox(height: 2),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              categoryText,
              style: LineItUpTextTheme()
                  .body
                  .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
