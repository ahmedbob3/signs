import 'package:intl/intl.dart';

extension DateFormating on String {
  String formatDate({String sourceDateFormat, String destinationFormat}) {
    DateTime sourceDateTime = DateFormat(sourceDateFormat).parse(this);
    String destinationDateString =  DateFormat(destinationFormat).format(sourceDateTime);
    return destinationDateString;
  }
}