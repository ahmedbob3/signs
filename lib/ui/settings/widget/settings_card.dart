import 'package:Signs/Utils/style/theme.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final String cardName;
  final String cardIconPath;
  final Function onSelect;

  const SettingsCard({Key key, @required this.cardName, @required this.cardIconPath, @required this.onSelect}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.only(left:8.0, right: 8, top: 16, bottom: 16),
        child: Row(
          children: [
            Image.asset(cardIconPath, width: 20, height: 20,),
            SizedBox(width: 20,),
            Text(cardName, style: dimGreyBoldStyle,),
            Expanded(child: Container()),
            Icon(Icons.arrow_forward_ios, color: lightSlateGrey,)
          ],
        ),
      ),
    );
  }
}
