import 'package:Signs/Models/response/medication_model.dart';
import 'package:intl/intl.dart';




class ConstantMethods {

  static String whichSooner(List<String> rememberTime) {
    rememberTime.sort();
    return rememberTime.elementAt(0).toString();
  }

  static List<Datum> sortTime(List<Datum> data) {
  List<String> times = [];
  List<Datum> temp=[];
  for(int i=0;i<data.length;i++){
      DateTime temp = DateFormat('yyyy-MM-dd – hh:mm').parse(DateFormat('yyyy-MM-dd – ${whichSooner(data.elementAt(i).rememberTime)}').format(DateTime.now()));
      data.elementAt(i).lessTime = DateFormat("hh:mm a").format(temp).toString();
      times.add(data.elementAt(i).lessTime);
  }
  times.sort();
  for (int i=0;i<times.length;i++)
    {
      for(int j=0;j<times.length;j++){
        if(times.elementAt(i)==data.elementAt(j).lessTime)
          temp.add(data.elementAt(j));
      }
    }
return temp;
}
}
