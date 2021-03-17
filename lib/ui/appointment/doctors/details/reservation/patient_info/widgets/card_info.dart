import 'dart:io';
import 'package:Signs/Utils/style/theme.dart';
import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  final File selectedCardImage;
  final String cardUrl;
  final String cardId;
  final Function onSelected;
  final Function onDeleted;
  final bool isSelected;
  const CardInfo({Key key, this.selectedCardImage, this.cardUrl, this.cardId, this.onSelected, this.isSelected, this.onDeleted}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: isSelected,
          groupValue: true,
          onChanged: (newValue){
            if(newValue){
              onSelected();
            }
          }
        ),
        SizedBox(width: 24,),
        Image.file(selectedCardImage, width: 80, height: 60, fit: BoxFit.fitWidth,),
        SizedBox(width: 24,),
        Expanded(child: Text(cardId, style: outerSpaceStyle,)),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: (){
            onDeleted();
          },
          color: coralRed,
        )
      ],
    );
  }
}
