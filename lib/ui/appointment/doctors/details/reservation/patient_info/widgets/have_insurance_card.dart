import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/style/theme.dart';
import 'package:flutter/material.dart';

class HaveInsuranceCard extends StatelessWidget {
  final bool isSelected;
  final ValueChanged<bool> onChanged;

  const HaveInsuranceCard({Key key, this.isSelected, this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      child: Padding(
        padding: const EdgeInsets.only(left:16.0, right: 16, top: 4, bottom: 4),
        child: Row(
          children: [
            Image.asset(IC_HEALTH_INSURANCE, width: 30, height: 30,),
            SizedBox(width: 20,),
            Expanded(child: Text('Have insurence', style: boldSmaltTextStyle2,)),
            Checkbox(
              value: isSelected, onChanged: onChanged
            )
          ],
        ),
      ),
    );
  }
}
