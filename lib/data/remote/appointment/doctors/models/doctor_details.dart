class DoctorDetails{
  final int id;
  final String name;
  final String bio;
  final String speciality;
  final String imageUrl;
  final int yearsOfExperience;
  final String description;
  final List<String> achievements;
  final List<String> videos;
  final List<String> articles;

  DoctorDetails({this.yearsOfExperience, this.description, this.achievements, this.videos, this.articles, this.id, this.name, this.bio, this.speciality, this.imageUrl,});
}