import 'package:Signs/Utils/style/theme.dart';
import 'package:flutter/material.dart';

class CustomEditText extends StatelessWidget {
  final String hintText;
  final Function validator;
  final ValueChanged<String> onFieldSubmitted;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final Widget prefixIcon;
  final bool autoFocus;
  final Color fillColor;
  final TextDirection textDirection;

  const CustomEditText({
    Key key,
    this.hintText,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.focusNode,
    this.textInputAction,
    this.prefixIcon,
    this.autoFocus = false,
    this.fillColor = Colors.white,
    this.textDirection = TextDirection.ltr
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      elevation: 2,
      child: TextFormField(
        autofocus: autoFocus,
        keyboardType: keyboardType,
        controller: controller,
        textInputAction: textInputAction,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        validator: validator,
        textDirection: textDirection,
        decoration: InputDecoration(
          fillColor: fillColor,
          prefixIcon: prefixIcon,
          filled: true,
          hintText: hintText,
          hintStyle: hintTextStyle,
          contentPadding: EdgeInsets.all(0),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.white, width: 1, style: BorderStyle.none)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.white, width: 1, style: BorderStyle.none)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.white, width: 1, style: BorderStyle.none)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.white, width: 1, style: BorderStyle.none)
          ),
        ),
      ),
    );
  }
}
