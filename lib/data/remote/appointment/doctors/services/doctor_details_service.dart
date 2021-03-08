import 'package:Signs/data/remote/appointment/doctors/models/doctor_details.dart';

class DoctorDetailsService{
  Future<DoctorDetails> getDoctorDetails(int doctorId){
    return Future.delayed(Duration(seconds: 1), (){
      return DoctorDetails(
        id: 1,
        name: "Ahmed",
        bio: "alcemi doctor",
        speciality: "Heart",
        imageUrl: "https://i.picsum.photos/id/113/200/300.jpg?hmac=DvsBBpPushDywwuMaEX4gQacembMMccz2r-xKWuO82k",
        yearsOfExperience: 5,
        description: 'Dr. Albert Alexanderis a Renal Physician who has comprehensive expertise in the fields of Renal Medicine and Internal Medicine. While Dr Ho specializes in dialysis and critical care nephrology, years of extensive training have also equipped him with skills to effectively handle a wide range of other kidney diseases, including kidney impairment, inflammation, infection and transplantation.',
        achievements: [
          'https://via.placeholder.com/140x100',
          'https://via.placeholder.com/140x100',
          'https://via.placeholder.com/140x100',
          'https://via.placeholder.com/140x100',
          'https://via.placeholder.com/140x100',
          'https://via.placeholder.com/140x100',
          'https://via.placeholder.com/140x100',
        ],
        videos: [
          'https://www.youtube.com/watch?v=xTDFoYPxhkY&list=PLJYf0JdTApCoxxuHU_pbYpINacRN0-AG4',
          'https://www.youtube.com/watch?v=xTDFoYPxhkY&list=PLJYf0JdTApCoxxuHU_pbYpINacRN0-AG4',
          'https://www.youtube.com/watch?v=xTDFoYPxhkY&list=PLJYf0JdTApCoxxuHU_pbYpINacRN0-AG4',
        ],
        articles: [
          'https://www.article.com/product/11833/sven-charme-tan-sofa',
          'https://www.filgoal.com/articles/405900/%D9%85%D8%AA%D8%AD%D8%AF%D8%AB-%D8%A7%D9%84%D8%B2%D9%85%D8%A7%D9%84%D9%83-%D9%82%D8%B1%D8%A7%D8%B1%D8%A7%D8%AA-%D9%87%D8%A7%D9%85%D8%A9-%D9%84%D8%AA%D8%B9%D8%AF%D9%8A%D9%84-%D9%85%D8%B3%D8%A7%D8%B1-%D8%A7%D9%84%D9%81%D8%B1%D9%8A%D9%82-%D9%88%D9%85%D9%88%D9%82%D9%81-%D9%85%D9%84%D9%81-%D8%B3%D8%A7%D8%B3%D9%8A-%D9%88%D8%AD%D9%82%D9%8A%D9%82%D8%A9-%D9%85%D8%A7-%D8%AD%D8%AF%D8%AB-%D9%85%D8%B9-%D8%A8%D9%86%D8%B4%D8%B1%D9%82%D9%8A',
          'https://www.filgoal.com/articles/405900/%D9%85%D8%AA%D8%AD%D8%AF%D8%AB-%D8%A7%D9%84%D8%B2%D9%85%D8%A7%D9%84%D9%83-%D9%82%D8%B1%D8%A7%D8%B1%D8%A7%D8%AA-%D9%87%D8%A7%D9%85%D8%A9-%D9%84%D8%AA%D8%B9%D8%AF%D9%8A%D9%84-%D9%85%D8%B3%D8%A7%D8%B1-%D8%A7%D9%84%D9%81%D8%B1%D9%8A%D9%82-%D9%88%D9%85%D9%88%D9%82%D9%81-%D9%85%D9%84%D9%81-%D8%B3%D8%A7%D8%B3%D9%8A-%D9%88%D8%AD%D9%82%D9%8A%D9%82%D8%A9-%D9%85%D8%A7-%D8%AD%D8%AF%D8%AB-%D9%85%D8%B9-%D8%A8%D9%86%D8%B4%D8%B1%D9%82%D9%8A',
        ]
      );
    });
  }
}