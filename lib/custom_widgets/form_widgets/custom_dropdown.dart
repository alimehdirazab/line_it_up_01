part of 'form_widgets.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    super.key,
    this.options = const [],
    this.value,
    this.onChanged,
    this.isDense = false,
    this.filled = false,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.enabledBorder,
    this.focusedBorder,
    this.contentPadding,
    this.style,
    this.errorText,
    this.errorStyle,
    this.hintText,
    this.hintStyle,
    this.dropdownColor,
  });

  final List<CustomDropDownOption<T>> options;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final bool? isDense;
  final bool? filled;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;
  final String? errorText;
  final TextStyle? errorStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? dropdownColor;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      hint: Text(
        '$hintText',
        style: LineItUpTextTheme().body.copyWith(fontSize: 14),
      ),
      isExpanded: false,
      dropdownColor: dropdownColor ?? LineItUpColorTheme().secondary,
      borderRadius: BorderRadius.circular(16),
      icon: Icon(
        Icons.expand_more,
        color: LineItUpColorTheme().secondary,
      ),
      items: options.map((option) {
        return DropdownMenuItem(
            value: option.value,
            child: Text(
              option.displayOption,
              overflow: TextOverflow.ellipsis,
            ));
      }).toList(),
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: LineItUpColorTheme().grey30,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: LineItUpColorTheme().secondary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        isDense: isDense,
        contentPadding:
            contentPadding ?? const EdgeInsets.fromLTRB(16, 12, 16, 12),
        errorText: errorText,
        errorStyle: errorStyle,
        // hintText: hintText,
        hintStyle: hintStyle,
      ),
      style: style ??
          LineItUpTextTheme().body.copyWith(
                color: LineItUpColorTheme().white,
              ),
      value: value,
      onChanged: onChanged,
    );
  }
}

class CustomDropDownOption<T> {
  final T value;
  final String displayOption;

  const CustomDropDownOption({
    required this.value,
    required this.displayOption,
  });
}
