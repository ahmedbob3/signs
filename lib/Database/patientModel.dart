
class PatientModel{

  int _id ;
  String _firstName ;
  String _lastName ;
  String _phoneNumber ;
  String _email ;
  String _dateOfBirth ;
  String _gender ;
  String _accountType ;
  String _status ;
  double _weight ;
  double _height ;
  int _bedTime ;
  int _wakeUpTime ;


  set setId(int value) {
    _id = value;
  }
  set setFirstName(String value) {
    _firstName = value;
  }
  set setLastName(String value) {
    _lastName = value;
  }
  set setPhoneNumber(String value) {
    _phoneNumber = value;
  }
  set setEmail(String value) {
    _email = value;
  }
  set setDateOfBirth(String value) {
    _dateOfBirth = value;
  }
  set setGender(String value) {
    _gender = value;
  }
  set setAccountType(String value) {
    _accountType = value;
  }
  set setStatus(String value) {
    _status = value;
  }
  set setWeight(double value) {
    _weight = value;
  }
  set setHeight(double value) {
    _height = value;
  }
  set setBedTime(int value) {
    _bedTime = value;
  }
  set setWakeUpTime(int value) {
    _wakeUpTime = value;
  }


  int get getId => _id;
  String get getFirstName => _firstName;
  String get getLastName => _lastName;
  String get getPhoneNumber => _phoneNumber;
  String get getEmail => _email;
  String get getDateOfBirth => _dateOfBirth;
  String get getGender => _gender;
  String get getAccountType => _accountType;
  String get getStatus => _status;
  double get getWeight => _weight;
  double get getHeight => _height;
  int get getBedTime => _bedTime;
  int get getWakeUpTime => _wakeUpTime;

}