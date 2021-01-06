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

  List<Datum> resultData=[];


  for (int i=0;i<data.length;i++){
    for (int j=0;j<data.elementAt(i).rememberTime.length;j++)
      {
        Datum tempData = new Datum();
        tempData.setcreatedDatetime(data.elementAt(i).createdDatetime);
        tempData.setisActive(data.elementAt(i).isActive);
        tempData.setmDose(data.elementAt(i).mDose);
        tempData.setmDuration(data.elementAt(i).mDuration);
        tempData.setmfImage(data.elementAt(i).mfImage);
        tempData.setmfName(data.elementAt(i).mfName);
        tempData.setmId(data.elementAt(i).mId);
        tempData.setmName(data.elementAt(i).mName);
        tempData.setmReminderNote(data.elementAt(i).mReminderNote);
        tempData.setrememberTime([data.elementAt(i).rememberTime.elementAt(j)]);
        tempData.setlessTime(DateFormat("hh:mm a").format(DateFormat('yyyy-MM-dd – hh:mm').parse(DateFormat('yyyy-MM-dd – ${data.elementAt(i).rememberTime.elementAt(j)}').format(DateTime.now()))).toString());
        resultData.add(tempData);
        times.add(DateFormat("hh:mm a").format(DateFormat('yyyy-MM-dd – hh:mm').parse(DateFormat('yyyy-MM-dd – ${data.elementAt(i).rememberTime.elementAt(j)}').format(DateTime.now()))).toString());
      }
  }
  times.sort();
  for (int i=0;i<times.length;i++)
    {
      for(int j=0;j<times.length;j++){
        if(times.elementAt(i)==resultData.elementAt(j).lessTime)
          temp.add(resultData.elementAt(j));
      }
    }
return temp;
}
}
