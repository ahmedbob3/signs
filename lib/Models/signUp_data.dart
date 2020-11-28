

class SignUpData {
  String mobileNumber;
  String firstName;
  String lastName;
  String email;
  String password;
  String gender;
  String birthDate;
  String weight;
  String height;
  String bedTime;
  String wakeupTime;
  String countryCode;

  void setMobileNumber(String mNumber) {
    mobileNumber=mNumber;
  }
  void setCountryCode(String cCode) {
    countryCode=cCode;
  }
  void setFirstName(String fName) {
    firstName=fName;
  }
  void setLastName(String lName) {
    lastName=lName;
  }
  void setEmail(String em) {
    email=em;
  }
  void setPassword(String pass) {
    password=pass;
  }
  void setGender(String gen) {
    gender=gen;
  }
  void setBirthDate(String bir) {
    birthDate=bir;
  }
  void setWeight(String we) {
    weight=we;
  }
  void setHeight(String he) {
    height=he;
  }
  void setBedTime(String bed) {
    bedTime=bed;
  }
  void setWakeupTime(String wake) {
    wakeupTime=wake;
  }
  String getMobileNumber(){
    return mobileNumber;
  }
  String getFirstName(){
    return firstName;
  }
  String getLastName(){
    return lastName;
  }
  String getEmail(){
    return email;
  }
  String getPassword(){
    return password;
  }
  String getGender(){
    return gender;
  }
  String getBirthDate(){
    return birthDate;
  }
  String getWeight(){
    return weight;
  }
  String getHeight(){
    return height;
  }
  String getBedTime(){
    return bedTime;
  }
  String getWakeupTime(){
    return wakeupTime;
  }

}

