import 'package:flutter/material.dart';
import 'package:signs/Utils/constants.dart';
import 'package:signs/Utils/styles.dart';

class Widgets {
  call() {}
}

TextFormField textField(String hintText, Function callback,
    {bool isPassword = false,
    bool isDense = true,
    Function showPassword,
    bool isPhoneKeyboard = false,
    bool isClicable,
    TextEditingController controller,
    Icon icon,
    Color color,
    double fontSize = 16,
    Widget prefixIcon,
    int maxLines = 1}) {
  return TextFormField(
    enabled: isClicable,
    style: Constants().labelStyle(fontSize: 20),
    controller: controller,
    autofocus: false,
    maxLines: maxLines,
    decoration: InputDecoration(
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(0),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(0),
      ),
      // labelText: hintText,
      // errorStyle: Constants.fontLight(color: Colors.red),
      hintStyle: Constants().labelStyle(fontSize: 20),
      // isDense: true,
      hintText: hintText,
      fillColor: color == null ? Colors.white : color,
      filled: true,
      // labelStyle: Constants.fontLight(color: Colors.grey, fontSize: fontSize),
      // helperStyle: Constants.fontLight(color: Colors.grey),
      suffixIcon: isPassword
          ? IconButton(
              icon: Icon(Icons.remove_red_eye, color: Colors.white),
              onPressed: showPassword)
          : icon == null ? null : icon,
      prefixIcon: Container(
        child: prefixIcon != null ? prefixIcon : Container(),
        height: 30,
        width: 30,
      ),
    ),
    textInputAction: TextInputAction.done,
    keyboardType: isPhoneKeyboard ? TextInputType.phone : TextInputType.text,
    obscureText: isPassword ? isDense : false,
    onSaved: (value) {
      callback(value);
    },
    validator: (String arg) {
      if (arg.length < 3)
        return 'Please Enter $hintText';
      else
        return null;
    },
  );
}

Widget button(Function onPress, String labelText,
    {bool isFilledColor = true, Color color}) {
  return MaterialButton(
    onPressed: onPress,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
      side: BorderSide(color: Colors.red),
    ),
    elevation: 0,
    color: Colors.red,
    child: Text(
      labelText,
      style: TextStyle(
          color: color != null ? defaultBackgroundColor : Colors.white,
          fontSize: 20,
          fontFamily: boldFontFamily),
    ),
  );
}
