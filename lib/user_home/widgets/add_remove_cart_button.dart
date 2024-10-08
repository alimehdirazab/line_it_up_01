part of 'widgets.dart';

class AddRemoveCartButton extends StatelessWidget {
  final int productId; // Add productId parameter
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final int cartCountt;
  final double width;
  final double height;
  const AddRemoveCartButton({
    super.key,
    required this.productId,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.cartCountt = 0,
    this.width = 88,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserHomeCubit, UserHomeState>(
        buildWhen: (previous, current) =>
            previous.cartItems != current.cartItems,
        builder: (context, state) {
          // Get the cart count for the specific product
          final cartCount = state.cartItems[productId] ?? cartCountt;

          return cartCount == 0
              ? CircleButton(
                  onPressed: () => context
                      .read<UserHomeCubit>()
                      .updateCartItemCount(productId, cartCount + 1),
                  icon: LineItUpIcons().add,
                  radius: 20,
                  backgroundColor:
                      backgroundColor ?? LineItUpColorTheme().primary,
                  iconColor: iconColor ?? LineItUpColorTheme().white,
                )
              : Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: backgroundColor ?? LineItUpColorTheme().primary,
                    borderRadius: BorderRadius.circular(54),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<UserHomeCubit>()
                              .updateCartItemCount(productId, cartCount - 1);
                        },
                        child: Icon(
                          cartCount > 1
                              ? LineItUpIcons().remove
                              : LineItUpIcons().delete1,
                          size: 20,
                          color: iconColor ?? LineItUpColorTheme().white,
                        ),
                      ),
                      Text(
                        cartCount.toString(),
                        style: LineItUpTextTheme().body.copyWith(
                              color: textColor ?? LineItUpColorTheme().white,
                            ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<UserHomeCubit>()
                              .updateCartItemCount(productId, cartCount + 1);
                        },
                        child: Icon(
                          LineItUpIcons().add,
                          size: 20,
                          color: iconColor ?? LineItUpColorTheme().white,
                        ),
                      ),
                    ],
                  ),
                );
        });
  }
}
