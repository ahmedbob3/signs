import 'dart:io';
import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/data/remote/appointment/reservation/models/patient_cards_entity.dart';
import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  final String selectedCardImage;
  final String cardUrl;
  final String cardId;
  final Function onSelected;
  final Function onDeleted;
  final bool isSelected;
  final PatientCardsData cardData;

  const CardInfo({Key key, this.selectedCardImage, this.cardUrl, this.cardId, this.onSelected, this.isSelected, this.onDeleted, this.cardData}) : super(key: key);
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
              if(cardData != null)
                Image.network(cardData.piCardImage, width: 60, height: 40, fit: BoxFit.fitWidth)
              else
              Image.network(selectedCardImage, width: 60, height: 40, fit: BoxFit.fitWidth,),
              SizedBox(width: 24,),
              Expanded(child: Text((cardData != null) ?cardData.piIdCard:cardId, style: outerSpaceStyle,)),
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
