import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  final assetPath;
  final serviceName;
  final serviceDescription;
  const Service({Key key, this.assetPath, this.serviceName, this.serviceDescription}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(assetPath, width: 55, height: 55,),
        SizedBox(width: 16,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(serviceName),
              Text(serviceDescription),
            ],
          ),
        )
      ],
    );
  }
}
