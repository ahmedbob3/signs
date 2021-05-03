// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Appointments`
  String get appointments {
    return Intl.message(
      'Appointments',
      name: 'appointments',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Past`
  String get past {
    return Intl.message(
      'Past',
      name: 'past',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message(
      'Upcoming',
      name: 'upcoming',
      desc: '',
      args: [],
    );
  }

  /// `There’s no appointments Yet !`
  String get noAppointmentsMsg {
    return Intl.message(
      'There’s no appointments Yet !',
      name: 'noAppointmentsMsg',
      desc: '',
      args: [],
    );
  }

  /// `Offline Appointment`
  String get offlineAppointments {
    return Intl.message(
      'Offline Appointment',
      name: 'offlineAppointments',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Rate Appointment`
  String get rateAppointment {
    return Intl.message(
      'Rate Appointment',
      name: 'rateAppointment',
      desc: '',
      args: [],
    );
  }

  /// `at`
  String get at {
    return Intl.message(
      'at',
      name: 'at',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Details`
  String get appointmentDetails {
    return Intl.message(
      'Appointment Details',
      name: 'appointmentDetails',
      desc: '',
      args: [],
    );
  }

  /// `Rate`
  String get rate {
    return Intl.message(
      'Rate',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  /// `Give us your feedback`
  String get feedBackHint {
    return Intl.message(
      'Give us your feedback',
      name: 'feedBackHint',
      desc: '',
      args: [],
    );
  }

  /// `Hospital`
  String get hospital {
    return Intl.message(
      'Hospital',
      name: 'hospital',
      desc: '',
      args: [],
    );
  }

  /// `What are you looking for ?`
  String get lookingForMsg {
    return Intl.message(
      'What are you looking for ?',
      name: 'lookingForMsg',
      desc: '',
      args: [],
    );
  }

  /// `Physical Appointment`
  String get physicalAppointment {
    return Intl.message(
      'Physical Appointment',
      name: 'physicalAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Book an appointment with a doctor in required specialty`
  String get physicalAppointmentMsg {
    return Intl.message(
      'Book an appointment with a doctor in required specialty',
      name: 'physicalAppointmentMsg',
      desc: '',
      args: [],
    );
  }

  /// `Online Appointment`
  String get onlineAppointment {
    return Intl.message(
      'Online Appointment',
      name: 'onlineAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Book online an appointment with a doctor in required specialty`
  String get onlineAppointmentMsg {
    return Intl.message(
      'Book online an appointment with a doctor in required specialty',
      name: 'onlineAppointmentMsg',
      desc: '',
      args: [],
    );
  }

  /// `Medical History`
  String get medicalHistory {
    return Intl.message(
      'Medical History',
      name: 'medicalHistory',
      desc: '',
      args: [],
    );
  }

  /// `You can Request your medical history from the hospital in required specialty`
  String get medicalHistoryMsg {
    return Intl.message(
      'You can Request your medical history from the hospital in required specialty',
      name: 'medicalHistoryMsg',
      desc: '',
      args: [],
    );
  }

  /// `Emergency call`
  String get emergencyCall {
    return Intl.message(
      'Emergency call',
      name: 'emergencyCall',
      desc: '',
      args: [],
    );
  }

  /// `You can make a Emergency call`
  String get emergencyCallMsg {
    return Intl.message(
      'You can make a Emergency call',
      name: 'emergencyCallMsg',
      desc: '',
      args: [],
    );
  }

  /// `Book Appointment`
  String get bookAppointment {
    return Intl.message(
      'Book Appointment',
      name: 'bookAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Search by Doctor Name`
  String get searchByDoctorName {
    return Intl.message(
      'Search by Doctor Name',
      name: 'searchByDoctorName',
      desc: '',
      args: [],
    );
  }

  /// `Videos`
  String get videos {
    return Intl.message(
      'Videos',
      name: 'videos',
      desc: '',
      args: [],
    );
  }

  /// `Years of experience`
  String get yearsOfExperience {
    return Intl.message(
      'Years of experience',
      name: 'yearsOfExperience',
      desc: '',
      args: [],
    );
  }

  /// `Articles`
  String get articles {
    return Intl.message(
      'Articles',
      name: 'articles',
      desc: '',
      args: [],
    );
  }

  /// `Make appointment`
  String get makeAppointment {
    return Intl.message(
      'Make appointment',
      name: 'makeAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Patient info`
  String get patientInfo {
    return Intl.message(
      'Patient info',
      name: 'patientInfo',
      desc: '',
      args: [],
    );
  }

  /// `You Have appointment for`
  String get youHaveAppointmentFor {
    return Intl.message(
      'You Have appointment for',
      name: 'youHaveAppointmentFor',
      desc: '',
      args: [],
    );
  }

  /// `Patient ID`
  String get patientId {
    return Intl.message(
      'Patient ID',
      name: 'patientId',
      desc: '',
      args: [],
    );
  }

  /// `Enter ID`
  String get enterId {
    return Intl.message(
      'Enter ID',
      name: 'enterId',
      desc: '',
      args: [],
    );
  }

  /// `Enter Medical card`
  String get enterMedicalCard {
    return Intl.message(
      'Enter Medical card',
      name: 'enterMedicalCard',
      desc: '',
      args: [],
    );
  }

  /// `Add New Card`
  String get addNewCard {
    return Intl.message(
      'Add New Card',
      name: 'addNewCard',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `please add patient id first`
  String get pleaseAddPatientIdFirst {
    return Intl.message(
      'please add patient id first',
      name: 'pleaseAddPatientIdFirst',
      desc: '',
      args: [],
    );
  }

  /// `Have insurance`
  String get haveInsurance {
    return Intl.message(
      'Have insurance',
      name: 'haveInsurance',
      desc: '',
      args: [],
    );
  }

  /// `please select image first`
  String get selectImageFirst {
    return Intl.message(
      'please select image first',
      name: 'selectImageFirst',
      desc: '',
      args: [],
    );
  }

  /// `please enter patient id`
  String get enterPatientId {
    return Intl.message(
      'please enter patient id',
      name: 'enterPatientId',
      desc: '',
      args: [],
    );
  }

  /// `select Image`
  String get selectImage {
    return Intl.message(
      'select Image',
      name: 'selectImage',
      desc: '',
      args: [],
    );
  }

  /// `Select image from Gallery or camera`
  String get selectImageFromGalleryOrCamera {
    return Intl.message(
      'Select image from Gallery or camera',
      name: 'selectImageFromGalleryOrCamera',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for booking !`
  String get thankBooking {
    return Intl.message(
      'Thank you for booking !',
      name: 'thankBooking',
      desc: '',
      args: [],
    );
  }

  /// `Book an appointment`
  String get bookAnAppointment {
    return Intl.message(
      'Book an appointment',
      name: 'bookAnAppointment',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Type`
  String get appointmentType {
    return Intl.message(
      'Appointment Type',
      name: 'appointmentType',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Date & Time`
  String get appointmentDateTime {
    return Intl.message(
      'Appointment Date & Time',
      name: 'appointmentDateTime',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get selectDate {
    return Intl.message(
      'Select Date',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `Select Time Slot`
  String get selectTimeSlot {
    return Intl.message(
      'Select Time Slot',
      name: 'selectTimeSlot',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Confirmation`
  String get appointmentConfirmation {
    return Intl.message(
      'Appointment Confirmation',
      name: 'appointmentConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Choose Speciality`
  String get chooseSpeciality {
    return Intl.message(
      'Choose Speciality',
      name: 'chooseSpeciality',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to clear your selection from the speciality filter?`
  String get clearSpecialityWarning {
    return Intl.message(
      'Are you sure you want to clear your selection from the speciality filter?',
      name: 'clearSpecialityWarning',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Search Speciality`
  String get searchSpeciality {
    return Intl.message(
      'Search Speciality',
      name: 'searchSpeciality',
      desc: '',
      args: [],
    );
  }

  /// `This Speciality not available right now`
  String get emptySpecialityMsg {
    return Intl.message(
      'This Speciality not available right now',
      name: 'emptySpecialityMsg',
      desc: '',
      args: [],
    );
  }

  /// `hour`
  String get hour {
    return Intl.message(
      'hour',
      name: 'hour',
      desc: '',
      args: [],
    );
  }

  /// `There’s No Doctors Found`
  String get noDoctorsMsg {
    return Intl.message(
      'There’s No Doctors Found',
      name: 'noDoctorsMsg',
      desc: '',
      args: [],
    );
  }

  /// `All Specialities`
  String get allSpecialities {
    return Intl.message(
      'All Specialities',
      name: 'allSpecialities',
      desc: '',
      args: [],
    );
  }

  /// `No Available Time slots`
  String get noAvailableTimeSlot {
    return Intl.message(
      'No Available Time slots',
      name: 'noAvailableTimeSlot',
      desc: '',
      args: [],
    );
  }

  /// `Coming soon`
  String get comingSoon {
    return Intl.message(
      'Coming soon',
      name: 'comingSoon',
      desc: '',
      args: [],
    );
  }

  /// `This feature will be added soon`
  String get willBeAdded {
    return Intl.message(
      'This feature will be added soon',
      name: 'willBeAdded',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUS {
    return Intl.message(
      'About Us',
      name: 'aboutUS',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms & conditions`
  String get termsConditions {
    return Intl.message(
      'Terms & conditions',
      name: 'termsConditions',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'ar', countryCode: 'SA'),
      Locale.fromSubtags(languageCode: 'as', countryCode: 'IN'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}