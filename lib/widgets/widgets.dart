import 'package:flutter/material.dart';
import 'package:signs/Utils/constants.dart';
import 'package:signs/Utils/images.dart';
import 'package:signs/Utils/styles.dart';

class Widgets {
  call() {}
}

Widget textField(String hintText, Function callback,
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
  return Container(
    height: 50,
    child: TextFormField(
      enabled: isClicable,
      style: Constants().labelStyle(fontSize: 20),
      controller: controller,
      autofocus: false,
      maxLines: maxLines,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]),
          borderRadius: BorderRadius.circular(20),
        ),
        // labelText: hintText,
        // errorStyle: Constants.fontLight(color: Colors.red),
        hintStyle: titleStyle(color: Colors.grey),
        // isDense: true,
        hintText: hintText,
        fillColor: color == null ? Color.fromRGBO(242, 244, 247, 1) : color,
        filled: true,
        // labelStyle: Constants.fontLight(color: Colors.grey, fontSize: fontSize),
        // helperStyle: Constants.fontLight(color: Colors.grey),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(Icons.remove_red_eye, color: Colors.white),
                onPressed: showPassword)
            : icon == null ? null : icon,
        prefixIcon: prefixIcon != null ? Container(
          child: prefixIcon,
          height: 30,
          width: 30,
        ) : null,
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
    ),
  );
}

Widget button(Function onPress, String labelText, {bool isFilledColor = true}) {
  return Container(
    width: double.infinity,
    height: 50,
    child: MaterialButton(
      onPressed: onPress,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.white),
      ),
      disabledColor: Color.fromRGBO(144	,156,	179,1),
      disabledTextColor: Colors.white,
      elevation: 0,
      color: isFilledColor ? defaultBackgroundColor : Colors.white  ,
      child: Text(
        labelText,
        style: TextStyle(
            color: isFilledColor ? Colors.white : defaultBackgroundColor,
            fontSize: 16,
            fontFamily: isFilledColor ? semiBoldFontFamily : mediumFontFamily),
      ),
    ),
  );
}

Widget headerBg() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Login_background), fit: BoxFit.cover)),
    child: Padding(
      padding: EdgeInsets.only(top: 10),
      child: Image.asset(
        Login_shape,
        fit: BoxFit.contain,
      ),
    ),
  );
}
