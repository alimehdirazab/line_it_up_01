part of 'form_widgets.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    TextEditingController? controller,
    this.enabled = true,
    this.initialValue,
    this.obscureText = false,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.filled = false,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.prefixText,
    this.prefixStyle,
    this.suffixIconColor,
    this.suffixIconSize,
    this.suffixIconConstraints,
    this.errorText,
    this.errorStyle,
    this.labelText,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.isDense = true,
    this.readOnly = false,
    this.alignLabelWithText,
    this.maxLines = 1,
    this.minLines,
    this.keyboardType,
    this.border,
    this.contentPadding,
    this.contentStyle,
    this.focusNode,
    this.onFieldSubmitted,
    this.validator,
    this.onTapOutside,
  }) : _controller = controller;

  final TextEditingController? _controller;
  final bool enabled;
  final String? initialValue;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool filled;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final Color? suffixIconColor;
  final double? suffixIconSize;
  final BoxConstraints? suffixIconConstraints;
  final String? errorText;
  final TextStyle? errorStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final bool isDense;
  final bool readOnly;
  final bool? alignLabelWithText;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? contentStyle;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final void Function(PointerDownEvent)? onTapOutside;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: onTapOutside ?? (_) => FocusScope.of(context).unfocus(),
      enabled: enabled,
      initialValue: initialValue,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        border: border,
        enabledBorder: enabledBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: LineItUpColorTheme().grey30,
              ),
            ),
        focusedBorder: focusedBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: LineItUpColorTheme().grey30,
              ),
            ),
        errorBorder: errorBorder ??
            const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
        focusedErrorBorder: focusedErrorBorder ??
            const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
        errorText: errorText,
        errorStyle: errorStyle,
        hintText: hintText,
        hintStyle: hintStyle ??
            LineItUpTextTheme()
                .body
                .copyWith(color: LineItUpColorTheme().black.withOpacity(0.4)),
        isDense: isDense,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        prefixStyle: prefixStyle ?? LineItUpTextTheme().body,
        contentPadding:
            contentPadding ?? const EdgeInsets.fromLTRB(0, 12, 16, 12),
        suffixIconConstraints: suffixIconConstraints,
        labelText: labelText,
        labelStyle: labelStyle ?? LineItUpTextTheme().body,
        alignLabelWithHint: alignLabelWithText,
      ),
      onTap: onTap,
      readOnly: readOnly,
      keyboardType: keyboardType,
      controller: _controller,
      onChanged: onChanged,
      focusNode: focusNode,
      validator: validator,
      style: contentStyle ?? LineItUpTextTheme().body,
      maxLines: maxLines,
      minLines: minLines,
    );
  }
}
