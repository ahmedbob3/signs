

class MedicationData {
  String medicationNumber;
  String medicationName;
  String medicationFormId;
  String medicationDose;
  String medicationDuration;
  String medicationNote;
  String medicationTime;
  String medicationCreateDate;



  void setMedicationNumber(String mNumber) {
    medicationNumber=mNumber;
  }
  void setMedicationName(String fName) {
    medicationName=fName;
  }
  void setMedicationFormId(String lName) {
    medicationFormId=lName;
  }
  void setMedicationDose(String em) {
    medicationDose=em;
  }
  void setMedicationDuration(String pass) {
    medicationDuration=pass;
  }
  void setMedicationNote(String gen) {
    medicationNote=gen;
  }
  void setMedicationTime(String bir) {
    medicationTime=bir;
  }
  void setMedicationCreateDate(String bir) {
    medicationCreateDate=bir;
  }

  String getMedicationNumber(){
    return medicationNumber;
  }
  String getMedicationName(){
    return medicationName;
  }
  String getMedicationFormId(){
    return medicationFormId;
  }
  String getMedicationDose(){
    return medicationDose;
  }
  String getMedicationDuration(){
    return medicationDuration;
  }
  String getMedicationNote(){
    return medicationNote;
  }
  String getMedicationTime(){
    return medicationTime;
  }
  String getMedicationCreateDate(){
    return medicationCreateDate;
  }


}

