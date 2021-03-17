import 'dart:io';

class InsuranceCard{
  int id;
  File insuranceImage;
  String insuranceCardName;
  bool isSelected = false;
  InsuranceCard({this.id, this.insuranceImage, this.insuranceCardName, this.isSelected});
}