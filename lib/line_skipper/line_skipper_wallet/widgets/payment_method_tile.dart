part of 'widgets.dart';

// ignore: must_be_immutable
class PaymentMethodTile extends StatelessWidget {
  final String paymetMehtodLogoUrl;
  final String paymentMethodName;
  final String? subtitle;
  final bool trailingIcon;
  final bool isPrimary;
  final void Function()? onTap;
  const PaymentMethodTile({
    super.key,
    required this.paymetMehtodLogoUrl,
    required this.paymentMethodName,
    this.subtitle,
    this.trailingIcon = false,
    this.isPrimary = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: LineItUpColorTheme().grey20,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(paymetMehtodLogoUrl),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(paymentMethodName,
                  style: LineItUpTextTheme().body.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      )),
              const SizedBox(height: 4),
              subtitle != null
                  ? Text(subtitle!,
                      style: LineItUpTextTheme().body.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: LineItUpColorTheme().grey))
                  : const SizedBox(),
            ],
          ),
          const Spacer(),
          isPrimary
              ? CustomElevatedButton(
                  title: translate(context, 'primary'),
                  buttonColor: LineItUpColorTheme().primary.withOpacity(0.10),
                  fontColor: LineItUpColorTheme().primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                )
              : const SizedBox(),
          const SizedBox(width: 8),
          trailingIcon
              ? Icon(Icons.arrow_forward_ios, color: LineItUpColorTheme().black)
              : const SizedBox(),
        ],
      ),
    );
  }
}
