
class HospitalModel{

  int _id ;
  String _userName ;
  String _name ;
  String _logo ;
  bool _hasBranches ;
  String _location ;
  String _addresses ;
  String _email ;
  String _about ;



  set setId(int value) {
    _id = value;
  }
  set setUserName(String value) {
    _userName = value;
  }
  set setName(String value) {
    _name = value;
  }
  set setLogo(String value) {
    _logo = value;
  }
  set setHasBranches(bool value) {
    _hasBranches = value;
  }
  set setLocation(String value) {
    _location = value;
  }
  set setAddresses(String value) {
    _addresses = value;
  }
  set setEmail(String value) {
    _email = value;
  }
  set setAbout(String value) {
    _about = value;
  }

  int get getId => _id;
  String get getUserName => _userName;
  String get getName => _name;
  String get getLogo => _logo;
  bool get getHasBranches => _hasBranches;
  String get getLocation => _location;
  String get getAddresses => _addresses;
  String get getEmail => _email;
  String get getAbout => _about;


}