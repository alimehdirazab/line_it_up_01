part of 'widgets.dart';

class CartProductTile extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productPrice;
  const CartProductTile({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              decoration: BoxDecoration(
                color: LineItUpColorTheme().grey20,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(productImage, width: 36, height: 31),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$$productPrice',
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ],
        ),
        AddRemoveCartButton(
          productId: 1,
          backgroundColor: LineItUpColorTheme().grey20,
          iconColor: LineItUpColorTheme().black,
          textColor: LineItUpColorTheme().black,
        ),
      ],
    );
  }
}
