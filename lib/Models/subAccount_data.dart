

class SubAccountData {

  String subAccountId;
  String subAccountFirstName;
  String subAccountLastName;
  String subAccountGender;
  String subAccountRelation;



  void setSubAccountId(String mNumber) {
    subAccountId=mNumber;
  }
  void setSubAccountFirstName(String fName) {
    subAccountFirstName=fName;
  }
  void setSubAccountLastName(String lName) {
    subAccountLastName=lName;
  }
  void setSubAccountGender(String em) {
    subAccountGender=em;
  }
  void setSubAccountRelation(String pass) {
    subAccountRelation=pass;
  }

  String getSubAccountId(){
    return subAccountId;
  }
  String getSubAccountFirstName(){
    return subAccountFirstName;
  }
  String getSubAccountLastName(){
    return subAccountLastName;
  }
  String getSubAccountGender(){
    return subAccountGender;
  }
  String getSubAccountRelation(){
    return subAccountRelation;
  }


}

