
class AppointmentModel{

  int _id ;
  String _appointmentNumber ;
  String _appointmentCreate ;
  String _appointmentDate ;
  String _appointmentHospital ;
  String _appointmentDoctor ;
  String _appointmentSpeciality ;
  String _appointmentAmount ;
  String _appointmentStatus ;



  set setId(int value) {
    _id = value;
  }
  set setAppointmentNumber(String value) {
    _appointmentNumber = value;
  }
  set setAppointmentCreate(String value) {
    _appointmentCreate = value;
  }
  set setAppointmentDate(String value) {
    _appointmentDate = value;
  }
  set setAppointmentHospital(String value) {
    _appointmentHospital = value;
  }
  set setAppointmentDoctor(String value) {
    _appointmentDoctor = value;
  }
  set setAppointmentSpeciality(String value) {
    _appointmentSpeciality = value;
  }
  set setAppointmentAmount(String value) {
    _appointmentAmount = value;
  }
  set setAppointmentStatus(String value) {
    _appointmentStatus = value;
  }

  int get getId => _id;
  String get getAppointmentNumber => _appointmentNumber;
  String get getAppointmentCreate => _appointmentCreate;
  String get getAppointmentDate => _appointmentDate;
  String get getAppointmentHospital => _appointmentHospital;
  String get getAppointmentDoctor => _appointmentDoctor;
  String get getAppointmentSpeciality => _appointmentSpeciality;
  String get getAppointmentAmount => _appointmentAmount;
  String get getAppointmentStatus => _appointmentStatus;


}