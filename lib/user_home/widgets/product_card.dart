part of 'widgets.dart';

class ProductCard extends StatelessWidget {
  final String productImage;
  final String $price;
  final String $productName;
  final String? weight;
  final int productId;
  final Function()? onTap;
  const ProductCard({
    super.key,
    required this.productImage,
    required this.$price,
    required this.$productName,
    this.weight,
    required this.productId,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 215,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
                  decoration: BoxDecoration(
                    color: LineItUpColorTheme().grey20,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(productImage, width: 96, height: 80),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 4, bottom: 4),
                    child: AddRemoveCartButton(productId: productId)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    // First text: Display a fixed currency symbol
                    Text(
                      '\$', // Assuming you're using the dollar symbol
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                ),
                // Second text: Extract the part before the decimal point
                Text(
                  $price.split(
                      '.')[0], // This gets the integer part before the decimal
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                Column(
                  children: [
                    // Third text: Extract the part after the decimal point if it exists
                    Text(
                      $price.contains('.')
                          ? $price.split('.')[1]
                          : '', // Gets the part after the decimal or nothing
                      style: LineItUpTextTheme().body.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              $productName,
              style: LineItUpTextTheme().body.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: LineItUpColorTheme().grey,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            if (weight != null) ...[
              Text(
                weight!,
                style: LineItUpTextTheme().body.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
