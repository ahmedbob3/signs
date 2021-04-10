import 'package:intl/intl.dart';

extension DateFormating on String {
  String formatDate({String sourceDateFormat, String destinationFormat}) {
    return DateFormat(destinationFormat).format(DateFormat(sourceDateFormat).parse(this));
  }
}