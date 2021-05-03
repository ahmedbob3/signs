import 'package:Signs/Utils/style/theme.dart';
import 'package:Signs/generated/l10n.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(S.of(context).settings, style: tealBlueBold18Style,),

      ],
    );
  }
}
