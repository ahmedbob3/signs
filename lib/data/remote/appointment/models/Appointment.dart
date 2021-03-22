class Appointment{
  int id;
  String doctorName;
  String doctorSpeciality;
  String doctorImageUrl;
  String appointmentDuration;
  String hospitalLocation;
  String appointmentDateTime;
  int appointmentStatus; // 1 -> past, 2 -> upcoming, 3-> cancelled
  Appointment({this.id, this.doctorName, this.doctorImageUrl, this.appointmentDuration, this.hospitalLocation, this.doctorSpeciality, this.appointmentDateTime, this.appointmentStatus});
}

const PAST = 1;
const UPCOMING = 2;
const CANCELLED = 3;


List<Appointment> getMockAppointments() {
  return [
    Appointment(
      id: 1,
      doctorName: 'Dr. Albert Alexander',
      doctorSpeciality: 'Orthopedic Specialist',
      doctorImageUrl: 'https://res.cloudinary.com/demo/image/fetch/https://upload.wikimedia.org/wikipedia/commons/1/13/Benedict_Cumberbatch_2011.png',
      appointmentDuration: '1 hour',
      appointmentStatus: 1,
      hospitalLocation: 'New Mowasat Hospital',
      appointmentDateTime: '30 July ,09:00 am'
    ),
    Appointment(
        id: 2,
        doctorName: 'Dr. Albert Alexander',
        doctorSpeciality: 'Orthopedic Specialist',
        doctorImageUrl: 'https://res.cloudinary.com/demo/image/fetch/https://upload.wikimedia.org/wikipedia/commons/1/13/Benedict_Cumberbatch_2011.png',
        appointmentDuration: '1 hour',
        appointmentStatus: 2,
        hospitalLocation: 'New Mowasat Hospital',
        appointmentDateTime: '30 July ,09:00 am'
    ),
    Appointment(
        id: 3,
        doctorName: 'Dr. Albert Alexander',
        doctorSpeciality: 'Orthopedic Specialist',
        doctorImageUrl: 'https://res.cloudinary.com/demo/image/fetch/https://upload.wikimedia.org/wikipedia/commons/1/13/Benedict_Cumberbatch_2011.png',
        appointmentDuration: '1 hour',
        appointmentStatus: 3,
        hospitalLocation: 'New Mowasat Hospital',
        appointmentDateTime: '30 July ,09:00 am'
    ),
    Appointment(
        id: 4,
        doctorName: 'Dr. Albert Alexander',
        doctorSpeciality: 'Orthopedic Specialist',
        doctorImageUrl: 'https://res.cloudinary.com/demo/image/fetch/https://upload.wikimedia.org/wikipedia/commons/1/13/Benedict_Cumberbatch_2011.png',
        appointmentDuration: '1 hour',
        appointmentStatus: 1,
        hospitalLocation: 'New Mowasat Hospital',
        appointmentDateTime: '30 July ,09:00 am'
    ),
    Appointment(
        id: 5,
        doctorName: 'Dr. Albert Alexander',
        doctorSpeciality: 'Orthopedic Specialist',
        doctorImageUrl: 'https://res.cloudinary.com/demo/image/fetch/https://upload.wikimedia.org/wikipedia/commons/1/13/Benedict_Cumberbatch_2011.png',
        appointmentDuration: '1 hour',
        appointmentStatus: 1,
        hospitalLocation: 'New Mowasat Hospital',
        appointmentDateTime: '30 July ,09:00 am'
    ),
    Appointment(
        id: 6,
        doctorName: 'Dr. Albert Alexander',
        doctorSpeciality: 'Orthopedic Specialist',
        doctorImageUrl: 'https://res.cloudinary.com/demo/image/fetch/https://upload.wikimedia.org/wikipedia/commons/1/13/Benedict_Cumberbatch_2011.png',
        appointmentDuration: '1 hour',
        appointmentStatus: 1,
        hospitalLocation: 'New Mowasat Hospital',
        appointmentDateTime: '30 July ,09:00 am'
    ),
    Appointment(
        id: 7,
        doctorName: 'Dr. Albert Alexander',
        doctorSpeciality: 'Orthopedic Specialist',
        doctorImageUrl: 'https://res.cloudinary.com/demo/image/fetch/https://upload.wikimedia.org/wikipedia/commons/1/13/Benedict_Cumberbatch_2011.png',
        appointmentDuration: '1 hour',
        appointmentStatus: 1,
        hospitalLocation: 'New Mowasat Hospital',
        appointmentDateTime: '30 July ,09:00 am'
    ),
    Appointment(
        id: 8,
        doctorName: 'Dr. Albert Alexander',
        doctorSpeciality: 'Orthopedic Specialist',
        doctorImageUrl: 'https://res.cloudinary.com/demo/image/fetch/https://upload.wikimedia.org/wikipedia/commons/1/13/Benedict_Cumberbatch_2011.png',
        appointmentDuration: '1 hour',
        appointmentStatus: 1,
        hospitalLocation: 'New Mowasat Hospital',
        appointmentDateTime: '30 July ,09:00 am'
    ),
    Appointment(
        id: 9,
        doctorName: 'Dr. Albert Alexander',
        doctorSpeciality: 'Orthopedic Specialist',
        doctorImageUrl: 'https://res.cloudinary.com/demo/image/fetch/https://upload.wikimedia.org/wikipedia/commons/1/13/Benedict_Cumberbatch_2011.png',
        appointmentDuration: '1 hour',
        appointmentStatus: 1,
        hospitalLocation: 'New Mowasat Hospital',
        appointmentDateTime: '30 July ,09:00 am'
    ),
];
}