import 'package:flutter/material.dart';

class FormFieldText extends StatelessWidget {
  final void Function(String?)? onSaved;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final TextStyle? style;
  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final double? radius;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  const FormFieldText({
    Key? key,
    this.autovalidateMode,
    this.keyboardType,
    this.textInputAction,
    this.hintText,
    this.obscureText,
    this.decoration,
    this.initialValue,
    this.onSaved,
    this.style,
    this.validator,
    this.radius,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: top ?? 10.0,
          bottom: bottom ?? 10.0,
          left: left ?? 25.0,
          right: right ?? 25.0),
      child: TextFormField(
        obscureText: obscureText ?? false,
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType ?? TextInputType.text,
        textInputAction: textInputAction ?? TextInputAction.next,
        onSaved: onSaved,
        initialValue: initialValue,
        style: style ?? TextStyle(fontSize: 16.0, color: Colors.black),
        validator: validator,
        decoration: decoration ??
            InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 40),
              ),
              hintText: hintText,
              labelText: labelText,
            ),
      ),
    );
  }
}
