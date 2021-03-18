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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            color: silverDivider,
            height: 2,
          ),
          Row(
            children: [
              Radio(
                value: isSelected,
                groupValue: true,
                toggleable: true,
                onChanged: (newValue){
                  print('inside on changed');
                  onSelected();
                }
              ),
              SizedBox(width: 24,),
              Image.file(selectedCardImage, width: 60, height: 40, fit: BoxFit.fitWidth,),
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
          ),
        ],
      ),
    );
  }
}
