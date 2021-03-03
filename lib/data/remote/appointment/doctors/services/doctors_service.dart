import 'package:Signs/data/remote/appointment/doctors/models/doctor.dart';

class DoctorsService{
  Future<List<Doctor>> getAvailableDoctors(){
    return Future.delayed(Duration(seconds: 1),(){
      return [
        Doctor(
          id: 1,
          name: "Ahmed",
          bio: "alcemi doctor",
          speciality: "Heart",
          imageUrl: "https://i.picsum.photos/id/113/200/300.jpg?hmac=DvsBBpPushDywwuMaEX4gQacembMMccz2r-xKWuO82k"
        ),
        Doctor(
            id: 1,
            name: "Ahmed",
            bio: "alcemi doctor",
            speciality: "Heart",
            imageUrl: "https://i.picsum.photos/id/113/200/300.jpg?hmac=DvsBBpPushDywwuMaEX4gQacembMMccz2r-xKWuO82k"
        ),
        Doctor(
            id: 1,
            name: "Ahmed",
            bio: "alcemi doctor",
            speciality: "Heart",
            imageUrl: "https://i.picsum.photos/id/113/200/300.jpg?hmac=DvsBBpPushDywwuMaEX4gQacembMMccz2r-xKWuO82k"
        ),
        Doctor(
            id: 1,
            name: "Ahmed",
            bio: "alcemi doctor",
            speciality: "Heart",
            imageUrl: "https://i.picsum.photos/id/113/200/300.jpg?hmac=DvsBBpPushDywwuMaEX4gQacembMMccz2r-xKWuO82k"
        ),
        Doctor(
            id: 1,
            name: "Ahmed",
            bio: "alcemi doctor",
            speciality: "Heart",
            imageUrl: "https://i.picsum.photos/id/113/200/300.jpg?hmac=DvsBBpPushDywwuMaEX4gQacembMMccz2r-xKWuO82k"
        ),
        Doctor(
            id: 1,
            name: "Ahmed",
            bio: "alcemi doctor",
            speciality: "Heart",
            imageUrl: "https://i.picsum.photos/id/113/200/300.jpg?hmac=DvsBBpPushDywwuMaEX4gQacembMMccz2r-xKWuO82k"
        )
      ];
    });
  }
}