part of 'form_widgets.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.title,
      this.hasIcon = false,
      this.icon,
      this.iconColor,
      this.iconSize,
      this.buttonColor,
      this.border,
      this.fontColor,
      this.fontSize,
      this.width,
      this.height,
      this.radius,
      this.padding,
      this.onTap,
      this.borderWidth,
      this.borderColor,
      this.fontWeight,
      this.rowMainAxisAlignment});

  final String title;
  final bool hasIcon;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final Color? buttonColor;
  final BorderSide? border;
  final Color? fontColor;
  final double? fontSize;
  final double? width;
  final double? height;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final double? borderWidth;
  final Color? borderColor;
  final FontWeight? fontWeight;
  final MainAxisAlignment? rowMainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: buttonColor ?? LineItUpColorTheme().primary,
            borderRadius: BorderRadius.circular(radius ?? 32),
            border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 1,
            )),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(12),
          child: hasIcon
              ? Row(
                  mainAxisAlignment:
                      rowMainAxisAlignment ?? MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: iconColor ?? LineItUpColorTheme().white,
                      size: iconSize ?? 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: LineItUpTextTheme().body.copyWith(
                            color: fontColor ?? LineItUpColorTheme().white,
                            fontSize: fontSize ?? 16,
                          ),
                    ),
                  ],
                )
              : Text(
                  title,
                  style: LineItUpTextTheme().body.copyWith(
                        color: fontColor ?? LineItUpColorTheme().white,
                        fontSize: fontSize ?? 16,
                        fontWeight: fontWeight ?? FontWeight.w500,
                      ),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
