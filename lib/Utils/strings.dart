import 'package:Signs/Utils/Strings%20Data/strings_ar.dart';
import 'package:Signs/Utils/Strings%20Data/strings_en.dart';
import 'package:Signs/Utils/Strings%20Data/strings_inr.dart';
import 'package:Signs/Utils/constants.dart';

class Strings {
  String appName() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.APP_NAME;
        break;
      case languages.Indian:
        return Strings_INR.APP_NAME;
        break;
      default:
        return Strings_EN.APP_NAME;
    }
  }

  String getWelcomeText() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.WELCOME;
        break;
      case languages.Indian:
        return Strings_INR.WELCOME;
        break;
      default:
        return Strings_EN.WELCOME;
    }
  }

  String getLoginTitle1() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.LOGIN_TITLE1;
        break;
      case languages.Indian:
        return Strings_INR.LOGIN_TITLE1;
        break;
      default:
        return Strings_EN.LOGIN_TITLE1;
    }
  }

  String getLoginTitle2() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.LOGIN_TITLE2;
        break;
      case languages.Indian:
        return Strings_INR.LOGIN_TITLE2;
        break;
      default:
        return Strings_EN.LOGIN_TITLE2;
    }
  }

  String getSingInText() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SIGN_IN;
        break;
      case languages.Indian:
        return Strings_INR.SIGN_IN;
        break;
      default:
        return Strings_EN.SIGN_IN;
    }
  }

  String getCreateAccountText() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.CREATE_ACCOUNT;
        break;
      case languages.Indian:
        return Strings_INR.CREATE_ACCOUNT;
        break;
      default:
        return Strings_EN.CREATE_ACCOUNT;
    }
  }

  String getDiscoverApp() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.DISCOVER_APP;
        break;
      case languages.Indian:
        return Strings_INR.DISCOVER_APP;
        break;
      default:
        return Strings_EN.DISCOVER_APP;
    }
  }

  String getSinginSlogan() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_IN_SLOGAN;
        break;
      case languages.Indian:
        return Strings_INR.SING_IN_SLOGAN;
        break;
      default:
        return Strings_EN.SING_IN_SLOGAN;
    }
  }

  String getMobileNumberString() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.MOBILE_NUMBER;
        break;
      case languages.Indian:
        return Strings_INR.MOBILE_NUMBER;
        break;
      default:
        return Strings_EN.MOBILE_NUMBER;
    }
  }

  String getEnterMobileNumberString() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.ENTER_MOBILE_NUMBER;
        break;
      case languages.Indian:
        return Strings_INR.ENTER_MOBILE_NUMBER;
        break;
      default:
        return Strings_EN.ENTER_MOBILE_NUMBER;
    }
  }

  String getContinueStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.CONTINUE;
        break;
      case languages.Indian:
        return Strings_INR.CONTINUE;
        break;
      default:
        return Strings_EN.CONTINUE;
    }
  }

  String getSignupStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP;
        break;
      default:
        return Strings_EN.SING_UP;
    }
  }

  String getSingupSlogan() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_SLOGAN;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_SLOGAN;
        break;
      default:
        return Strings_EN.SING_UP_SLOGAN;
    }
  }

  String getSignupStep1Strings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_STEP1;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_STEP1;
        break;
      default:
        return Strings_EN.SING_UP_STEP1;
    }
  }

  String getSignupStep2Strings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_STEP2;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_STEP2;
        break;
      default:
        return Strings_EN.SING_UP_STEP2;
    }
  }

  String getSignupStep3Strings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_STEP3;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_STEP3;
        break;
      default:
        return Strings_EN.SING_UP_STEP3;
    }
  }

  String getPasswordLength() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_PASSWORD;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_PASSWORD;
        break;
      default:
        return Strings_EN.SING_UP_PASSWORD;
    }
  }

  String getConfirmPassword() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_PASSWORD_CONFIRM;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_PASSWORD_CONFIRM;
        break;
      default:
        return Strings_EN.SING_UP_PASSWORD_CONFIRM;
    }
  }

  String getPassword() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_PASSWORD_TEXT;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_PASSWORD_TEXT;
        break;
      default:
        return Strings_EN.SING_UP_PASSWORD_TEXT;
    }
  }

  String getPasswordStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_PASSWORD_LENGTH;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_PASSWORD_LENGTH;
        break;
      default:
        return Strings_EN.SING_UP_PASSWORD_LENGTH;
    }
  }

  String getNameLengthStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.NAME_LENGTH;
        break;
      case languages.Indian:
        return Strings_INR.NAME_LENGTH;
        break;
      default:
        return Strings_EN.NAME_LENGTH;
    }
  }

  String getEmailVerifyStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.EMAIL_VERIFY;
        break;
      case languages.Indian:
        return Strings_INR.EMAIL_VERIFY;
        break;
      default:
        return Strings_EN.EMAIL_VERIFY;
    }
  }

  String getEnterPasswordStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_ENTER_PASSWORD;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_ENTER_PASSWORD;
        break;
      default:
        return Strings_EN.SING_UP_ENTER_PASSWORD;
    }
  }

  String getConfirmStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_CONFIRM;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_CONFIRM;
        break;
      default:
        return Strings_EN.SING_UP_CONFIRM;
    }
  }

  String getConfirmPasswordStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_CONFIRM_PASSWORD;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_CONFIRM_PASSWORD;
        break;
      default:
        return Strings_EN.SING_UP_CONFIRM_PASSWORD;
    }
  }

  String getNextStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.NEXT;
        break;
      case languages.Indian:
        return Strings_INR.NEXT;
        break;
      default:
        return Strings_EN.NEXT;
    }
  }

  String getHavingAccountStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.HAVING_ACCOUNT;
        break;
      case languages.Indian:
        return Strings_INR.HAVING_ACCOUNT;
        break;
      default:
        return Strings_EN.HAVING_ACCOUNT;
    }
  }

  String getPreviousStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.PREVIOUS;
        break;
      case languages.Indian:
        return Strings_INR.PREVIOUS;
        break;
      default:
        return Strings_EN.PREVIOUS;
    }
  }

  String getMaleStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.MALE;
        break;
      case languages.Indian:
        return Strings_INR.MALE;
        break;
      default:
        return Strings_EN.MALE;
    }
  }

  String getFemaleStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.FEMALE;
        break;
      case languages.Indian:
        return Strings_INR.FEMALE;
        break;
      default:
        return Strings_EN.FEMALE;
    }
  }

  String getGenderStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.GENDER;
        break;
      case languages.Indian:
        return Strings_INR.GENDER;
        break;
      default:
        return Strings_EN.GENDER;
    }
  }

  String getFirstNameStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_FIRST_NAME;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_FIRST_NAME;
        break;
      default:
        return Strings_EN.SING_UP_FIRST_NAME;
    }
  }

  String getEnterFirstStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_ENTER_FIRST;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_ENTER_FIRST;
        break;
      default:
        return Strings_EN.SING_UP_ENTER_FIRST;
    }
  }

  String getLastNameStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_LAST_NAME;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_LAST_NAME;
        break;
      default:
        return Strings_EN.SING_UP_LAST_NAME;
    }
  }

  String getEnterLastStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_ENTER_LAST;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_ENTER_LAST;
        break;
      default:
        return Strings_EN.SING_UP_ENTER_LAST;
    }
  }

  String getEmailStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_EMAIL;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_EMAIL;
        break;
      default:
        return Strings_EN.SING_UP_EMAIL;
    }
  }

  String getEnterEmailStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_ENTER_EMAIL;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_ENTER_EMAIL;
        break;
      default:
        return Strings_EN.SING_UP_ENTER_EMAIL;
    }
  }

  String getSubaccountStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_ADD_SUB_ACCOUNT;
        ;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_ADD_SUB_ACCOUNT;
        break;
      default:
        return Strings_EN.SING_UP_ADD_SUB_ACCOUNT;
    }
  }

  String getDatebirthStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_DATE_BIRTH;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_DATE_BIRTH;
        break;
      default:
        return Strings_EN.SING_UP_DATE_BIRTH;
    }
  }

  String getHeightTStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_HEIGHT;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_HEIGHT;
        break;
      default:
        return Strings_EN.SING_UP_HEIGHT;
    }
  }

  String getWeightStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_WEIGHT;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_WEIGHT;
        break;
      default:
        return Strings_EN.SING_UP_WEIGHT;
    }
  }

  String getBedtimeStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_BED_TIME;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_BED_TIME;
        break;
      default:
        return Strings_EN.SING_UP_BED_TIME;
    }
  }

  String getWaketimeStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_WAKE_TIME;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_WAKE_TIME;
        break;
      default:
        return Strings_EN.SING_UP_WAKE_TIME;
    }
  }

  String getSkipStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_SKIP;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_SKIP;
        break;
      default:
        return Strings_EN.SING_UP_SKIP;
    }
  }

  String getSubAccountStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_SUB_ACCOUNT;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_SUB_ACCOUNT;
        break;
      default:
        return Strings_EN.SING_UP_SUB_ACCOUNT;
    }
  }

  String getDoneStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_DONE;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_DONE;
        break;
      default:
        return Strings_EN.SING_UP_DONE;
    }
  }

  String getSaveStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SAVE;
        break;
      case languages.Indian:
        return Strings_INR.SAVE;
        break;
      default:
        return Strings_EN.SAVE;
    }
  }

  String getSingRelationStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_RELATION;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_RELATION;
        break;
      default:
        return Strings_EN.SING_UP_RELATION;
    }
  }

  String getSingSonStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_SON;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_SON;
        break;
      default:
        return Strings_EN.SING_UP_SON;
    }
  }

  String getSingMotherStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_MOTHER;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_MOTHER;
        break;
      default:
        return Strings_EN.SING_UP_MOTHER;
    }
  }

  String getSingAddAnotherStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SING_UP_ADD_ANOTHER;
        break;
      case languages.Indian:
        return Strings_INR.SING_UP_ADD_ANOTHER;
        break;
      default:
        return Strings_EN.SING_UP_ADD_ANOTHER;
    }
  }

  String getSelectAppLanguageStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SELECT_APP_LANGUAGE;
        break;
      case languages.Indian:
        return Strings_INR.SELECT_APP_LANGUAGE;
        break;
      default:
        return Strings_EN.SELECT_APP_LANGUAGE;
    }
  }

  String getMedicineAddStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.MEDICINE_ADD;
        break;
      case languages.Indian:
        return Strings_INR.MEDICINE_ADD;
        break;
      default:
        return Strings_EN.MEDICINE_ADD;
    }
  }

  String getMedicineStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.MEDICINE_FORM;
        break;
      case languages.Indian:
        return Strings_INR.MEDICINE_FORM;
        break;
      default:
        return Strings_EN.MEDICINE_FORM;
    }
  }

  String getTabletStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.TABLET;
        break;
      case languages.Indian:
        return Strings_INR.TABLET;
        break;
      default:
        return Strings_EN.TABLET;
    }
  }

  String getCapsuleStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.CAPSULE;
        break;
      case languages.Indian:
        return Strings_INR.CAPSULE;
        break;
      default:
        return Strings_EN.CAPSULE;
    }
  }

  String getLiquidStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.LIQUID;
        break;
      case languages.Indian:
        return Strings_INR.LIQUID;
        break;
      default:
        return Strings_EN.LIQUID;
    }
  }

  String getDropsStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.DROPS;
        break;
      case languages.Indian:
        return Strings_INR.DROPS;
        break;
      default:
        return Strings_EN.DROPS;
    }
  }

  String getSuppositoryStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SUPPOSITORY;
        break;
      case languages.Indian:
        return Strings_INR.SUPPOSITORY;
        break;
      default:
        return Strings_EN.SUPPOSITORY;
    }
  }

  String getTopicalStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.TOPICAL;
        break;
      case languages.Indian:
        return Strings_INR.TOPICAL;
        break;
      default:
        return Strings_EN.TOPICAL;
    }
  }

  String getInhalersStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.INHALERS;
        break;
      case languages.Indian:
        return Strings_INR.INHALERS;
        break;
      default:
        return Strings_EN.INHALERS;
    }
  }

  String getImplantsStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.IMPLANTS;
        break;
      case languages.Indian:
        return Strings_INR.IMPLANTS;
        break;
      default:
        return Strings_EN.IMPLANTS;
    }
  }

  String getPatchesStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.PATCHES;
        break;
      case languages.Indian:
        return Strings_INR.PATCHES;
        break;
      default:
        return Strings_EN.PATCHES;
    }
  }

  String getInjectionsStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.INJECTIONS;
        break;
      case languages.Indian:
        return Strings_INR.INJECTIONS;
        break;
      default:
        return Strings_EN.INJECTIONS;
    }
  }

  String getSachetsStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SACHETS;
        break;
      case languages.Indian:
        return Strings_INR.SACHETS;
        break;
      default:
        return Strings_EN.SACHETS;
    }
  }

  String getMedicationNameStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.MEDICATION_NAME;
        break;
      case languages.Indian:
        return Strings_INR.MEDICATION_NAME;
        break;
      default:
        return Strings_EN.MEDICATION_NAME;
    }
  }

  String getMedicationHowStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.MEDICATION_HOW;
        break;
      case languages.Indian:
        return Strings_INR.MEDICATION_HOW;
        break;
      default:
        return Strings_EN.MEDICATION_HOW;
    }
  }

  String getMedicationReminderStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.MEDICATION_REMINDER;
        break;
      case languages.Indian:
        return Strings_INR.MEDICATION_REMINDER;
        break;
      default:
        return Strings_EN.MEDICATION_REMINDER;
    }
  }

  String getMedicationDurationStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.MEDICATION_DURATION;
        break;
      case languages.Indian:
        return Strings_INR.MEDICATION_DURATION;
        break;
      default:
        return Strings_EN.MEDICATION_DURATION;
    }
  }

  String getMedicationHowLongStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.MEDICATION_HOW_LONG;
        break;
      case languages.Indian:
        return Strings_INR.MEDICATION_HOW_LONG;
        break;
      default:
        return Strings_EN.MEDICATION_HOW_LONG;
    }
  }

  String getMedicationNoteStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.MEDICATION_NOTE;
        break;
      case languages.Indian:
        return Strings_INR.MEDICATION_NOTE;
        break;
      default:
        return Strings_EN.MEDICATION_NOTE;
    }
  }

  String getMedicationHintStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.MEDICATION_HINT;
        break;
      case languages.Indian:
        return Strings_INR.MEDICATION_HINT;
        break;
      default:
        return Strings_EN.MEDICATION_HINT;
    }
  }

  String getSelectLabelStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SELECT;
        break;
      case languages.Indian:
        return Strings_INR.SELECT;
        break;
      default:
        return Strings_EN.SELECT;
    }
  }

  String getForgetPasswordStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.FORGET_PASSWORD;
        break;
      case languages.Indian:
        return Strings_INR.FORGET_PASSWORD;
        break;
      default:
        return Strings_EN.FORGET_PASSWORD;
    }
  }

  String getFillDataString() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.FILL_DATA;
        break;
      case languages.Indian:
        return Strings_INR.FILL_DATA;
        break;
      default:
        return Strings_EN.FILL_DATA;
    }
  }

  String getRemindersStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.UPCOMING_REMINDERS;
        break;
      case languages.Indian:
        return Strings_INR.UPCOMING_REMINDERS;
        break;
      default:
        return Strings_EN.UPCOMING_REMINDERS;
    }
  }

  String getHospitalsStrings() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.HOSPITALS;
        break;
      case languages.Indian:
        return Strings_INR.HOSPITALS;
        break;
      default:
        return Strings_EN.HOSPITALS;
    }
  }

  static String TimeNotification() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.TIME_NOTIFICATION;
        break;
      case languages.Indian:
        return Strings_INR.TIME_NOTIFICATION;
        break;
      default:
        return Strings_EN.TIME_NOTIFICATION;
    }
  }

  static String maoeed() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.MAOEED;
        break;
      case languages.Indian:
        return Strings_INR.MAOEED;
        break;
      default:
        return Strings_EN.MAOEED;
    }
  }

  static String notifBody(int numOfMin, String medName) {
    if (languages.English ?? false) {
      return Strings_EN.REMAINING +
          " " +
          "$numOfMin" +
          " " +
          Strings_EN.MINUTE +
          " " +
          Strings_EN.AT_WORD +
          " " +
          medName;
    } else {
      return Strings_AR.REMAINING +
          " " +
          "$numOfMin" +
          " " +
          ((numOfMin <= 10 || numOfMin >= 3)
              ? Strings_AR.MINUTES
              : Strings_AR.MINUTE) +
          " " +
          Strings_AR.AT_WORD +
          " " +
          medName;
    }
  }

  static String empty() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.EMPTY;
        break;
      case languages.Indian:
        return Strings_INR.EMPTY;
        break;
      default:
        return Strings_EN.EMPTY;
    }
  }

  static String getPhoneVerificationString() {
    // 'Phone Verification'
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.PHONE_VERIFICATION;
        break;
      case languages.Indian:
        return Strings_INR.PHONE_VERIFICATION;
        break;
      default:
        return Strings_EN.PHONE_VERIFICATION;
    }
  }

  static String getEnterOTPString() {
    // 'Phone Verification'
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.GET_OTP_DESCRIPTION;
        break;
      case languages.Indian:
        return Strings_INR.GET_OTP_DESCRIPTION;
        break;
      default:
        return Strings_EN.GET_OTP_DESCRIPTION;
    }
  }

  static String getNotGetCodeString() {
    // 'Phone Verification'
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.NOT_GET_CODE;
        break;
      case languages.Indian:
        return Strings_INR.NOT_GET_CODE;
        break;
      default:
        return Strings_EN.NOT_GET_CODE;
    }
  }

  static String getResendOTPString() {
    // 'Phone Verification'
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.GET_RESEND_OTP;
        break;
      case languages.Indian:
        return Strings_INR.GET_RESEND_OTP;
        break;
      default:
        return Strings_EN.GET_RESEND_OTP;
    }
  }

  static String getVerifiyString() {
    // 'Phone Verification'
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.VERIFY_OTP;
        break;
      case languages.Indian:
        return Strings_INR.VERIFY_OTP;
        break;
      default:
        return Strings_EN.VERIFY_OTP;
    }
  }

  static String getGuestUserString() {
    // 'Phone Verification'
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.GUEST_USER;
        break;
      case languages.Indian:
        return Strings_INR.GUEST_USER;
        break;
      default:
        return Strings_EN.GUEST_USER;
    }
  }

  String getShouldLoggedInString() {
    // 'Phone Verification'
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SHOULD_LOGIN;
        break;
      case languages.Indian:
        return Strings_INR.SHOULD_LOGIN;
        break;
      default:
        return Strings_EN.SHOULD_LOGIN;
    }
  }

  String dontHaveAccount() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.DONT_HAVE_ACCOUNT;
        break;
      case languages.Indian:
        return Strings_INR.DONT_HAVE_ACCOUNT;
        break;
      default:
        return Strings_EN.DONT_HAVE_ACCOUNT;
    }
  }

  String getAboutLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.ABOUT;
        break;
      case languages.Indian:
        return Strings_INR.ABOUT;
        break;
      default:
        return Strings_EN.ABOUT;
    }
  }

  String getDirectionsLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.DIRECTIONS;
        break;
      case languages.Indian:
        return Strings_INR.DIRECTIONS;
        break;
      default:
        return Strings_EN.DIRECTIONS;
    }
  }

  String getCallLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.CALL;
        break;
      case languages.Indian:
        return Strings_INR.CALL;
        break;
      default:
        return Strings_EN.CALL;
    }
  }

  String getGalleryLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.GALLERY;
        break;
      case languages.Indian:
        return Strings_INR.GALLERY;
        break;
      default:
        return Strings_EN.GALLERY;
    }
  }

  String getRefreshCompleteLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.REFRESH_COMPLETE;
        break;
      case languages.Indian:
        return Strings_INR.REFRESH_COMPLETE;
        break;
      default:
        return Strings_EN.REFRESH_COMPLETE;
    }
  }

  String getRetryLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.RETRY;
        break;
      case languages.Indian:
        return Strings_INR.RETRY;
        break;
      default:
        return Strings_EN.RETRY;
    }
  }

  String getMedicationListLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.MEDICATION_LIST;
        break;
      case languages.Indian:
        return Strings_INR.MEDICATION_LIST;
        break;
      default:
        return Strings_EN.MEDICATION_LIST;
    }
  }

  String getViewAllLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.VIEW_ALL;
        break;
      case languages.Indian:
        return Strings_INR.VIEW_ALL;
        break;
      default:
        return Strings_EN.VIEW_ALL;
    }
  }

  String getSelectSnoozeLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SELECT_SNOOZE;
        break;
      case languages.Indian:
        return Strings_INR.SELECT_SNOOZE;
        break;
      default:
        return Strings_EN.SELECT_SNOOZE;
    }
  }

  String getSnoozeForLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.SNOOZE_FOR;
        break;
      case languages.Indian:
        return Strings_INR.SNOOZE_FOR;
        break;
      default:
        return Strings_EN.SNOOZE_FOR;
    }
  }

  String getMinsLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.MINUTES;
        break;
      case languages.Indian:
        return Strings_INR.MINUTES;
        break;
      default:
        return Strings_EN.MINUTES;
    }
  }

  String getHoursLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.HOURS;
        break;
      case languages.Indian:
        return Strings_INR.HOURS;
        break;
      default:
        return Strings_EN.HOURS;
    }
  }

  String getAddRemoveLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.ADD_REMOVE_LIST;
        break;
      case languages.Indian:
        return Strings_INR.ADD_REMOVE_LIST;
        break;
      default:
        return Strings_EN.ADD_REMOVE_LIST;
    }
  }

  String getEnterTextAddLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.ENTER_TEXT_TO_ADD;
        break;
      case languages.Indian:
        return Strings_INR.ENTER_TEXT_TO_ADD;
        break;
      default:
        return Strings_EN.ENTER_TEXT_TO_ADD;
    }
  }

  String getAddListLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.ADD_TO_LIST;
        break;
      case languages.Indian:
        return Strings_INR.ADD_TO_LIST;
        break;
      default:
        return Strings_EN.ADD_TO_LIST;
    }
  }

  String getDeleteLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.DELETE;
        break;
      case languages.Indian:
        return Strings_INR.DELETE;
        break;
      default:
        return Strings_EN.DELETE;
    }
  }

  String getDeactivatedLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.DEACTIVATED;
        break;
      case languages.Indian:
        return Strings_INR.DEACTIVATED;
        break;
      default:
        return Strings_EN.DEACTIVATED;
    }
  }

  String getDaysLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.DAYS;
        break;
      case languages.Indian:
        return Strings_INR.DAYS;
        break;
      default:
        return Strings_EN.DAYS;
    }
  }


  String getAddPillReminderLabel() {
    switch (Constants.languageId) {
      case languages.Arabic:
        return Strings_AR.ADD_PILL_REMINDER;
        break;
      case languages.Indian:
        return Strings_INR.ADD_PILL_REMINDER;
        break;
      default:
        return Strings_EN.ADD_PILL_REMINDER;
    }
  }


 
}
