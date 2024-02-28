import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final bool autofocus;
  final String? labelText;
  final String? hintText;
  final bool readOnly;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  void Function(String)? onChanged;
  void Function()? onTap;
  void Function(PointerDownEvent)? onTapOutside;
  void Function(String)? onFieldSubmitted;
  String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final Brightness? keyboardAppearance;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final ScrollController? scrollController;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool showRequiredMark;
  final Key fieldKey;
  final TextMagnifierConfiguration? magnifierConfiguration;
  final Color fillColor;
  final bool outlined;

  AppTextFormField({
    super.key,
    this.fillColor = Colors.white10,
    this.outlined = true,
    required this.fieldKey,
    this.controller,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.expands = false,
    this.textCapitalization = TextCapitalization.none,
    this.readOnly = false,
    this.initialValue,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.labelText,
    this.hintText,
    this.showCursor,
    this.minLines,
    this.maxLength,
    required this.onChanged,
    this.onTap,
    this.onTapOutside,
    this.onFieldSubmitted,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.autofillHints,
    this.autovalidateMode,
    this.scrollController,
    this.magnifierConfiguration,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.obscureText = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.keyboardAppearance = Brightness.dark,
    this.showRequiredMark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText != null
            ? Row(
                children: [
                  Text(
                    '$labelText',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  showRequiredMark
                      ? const Text('*', style: TextStyle(color: Colors.red))
                      : Container(),
                ],
              )
            : Container(),
        SizedBox(
          height: labelText != null ? 5 : 0,
        ),
        TextFormField(
          key: fieldKey,
          initialValue: initialValue,
          onTapOutside: onTapOutside,
          obscureText: obscureText,
          controller: controller,
          maxLines: maxLines,
          readOnly: readOnly,
          onTap: onTap,
          enabled: enabled,
          onChanged: onChanged,
          autocorrect: autocorrect,
          autofocus: autofocus,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          keyboardAppearance: keyboardAppearance,
          validator: validator,
          style: const TextStyle(color: Colors.black),
          textCapitalization: textCapitalization,
          decoration: InputDecoration(
            border: outlined ? const OutlineInputBorder() : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            hintStyle: TextStyle(
              // color: Colors.black26,
              fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
            ),
            errorMaxLines: 10,
            fillColor: fillColor,
            filled: true,
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
        ),
      ],
    );
  }
}
