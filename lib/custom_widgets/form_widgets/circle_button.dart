part of '../../user_line_skipper/widgets/widgets.dart';

class CircleButton extends StatelessWidget {
  final IconData? icon;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? radius;
  final String? text;
  final TextStyle? textStyle;
  const CircleButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.backgroundColor,
    this.radius,
    this.iconColor,
    this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          CircleAvatar(
            radius: radius ?? 22,
            backgroundColor: backgroundColor ?? LineItUpColorTheme().white,
            child: Icon(
              icon,
              color: iconColor ?? LineItUpColorTheme().black,
            ),
          ),
          if (text != null)
            Text(
              text!,
              style: textStyle ?? LineItUpTextTheme().body,
            ),
        ],
      ),
    );
  }
}
