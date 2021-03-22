import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  final assetPath;
  final serviceName;
  final serviceDescription;
  final Function onClick;
  const Service({Key key, this.assetPath, this.serviceName, this.serviceDescription, this.onClick}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Row(
        children: [
          Image.asset(assetPath, width: 55, height: 55,),
          SizedBox(width: 16,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(serviceName, style:Theme.of(context).textTheme.subtitle1),
                Text(serviceDescription, style:Theme.of(context).textTheme.bodyText1),
              ],
            ),
          )
        ],
      ),
    );
  }
}
