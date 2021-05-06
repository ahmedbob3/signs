import 'package:Signs/Utils/style/theme.dart';
import 'package:flutter/material.dart';

class CustomEditText extends StatefulWidget {
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
  final Widget suffixIcon;
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
    this.suffixIcon,
    this.autoFocus = false,
    this.fillColor = Colors.white,
    this.textDirection = TextDirection.ltr
  }) : super(key: key);

  @override
  _CustomEditTextState createState() => _CustomEditTextState();
}

class _CustomEditTextState extends State<CustomEditText> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      elevation: 2,
      child: TextFormField(
        obscureText: widget.obscureText && hidePassword,
        autofocus: widget.autoFocus,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        textInputAction: widget.textInputAction,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        onChanged: widget.onChanged,
        validator: widget.validator,
        textDirection: widget.textDirection,
        decoration: InputDecoration(
          fillColor: widget.fillColor,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.obscureText? GestureDetector(
            child: Icon(Icons.remove_red_eye, size: ICON_SIZE, color: hidePassword? ashGrey :blueDefance,),
            onTap: (){
              setState(() {
                hidePassword = ! hidePassword;
              });
            },
          ): widget.suffixIcon,
          filled: true,
          hintText: widget.hintText,
          hintStyle: hintTextStyle,
          contentPadding: widget.prefixIcon != null ? EdgeInsets.all(0): EdgeInsets.only(left: 8, right: 8),
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
const ICON_SIZE = 18.0;