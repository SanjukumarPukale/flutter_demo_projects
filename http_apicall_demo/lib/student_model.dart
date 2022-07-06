class StudentModel {
  final String name;
  final String skill;
  final String education;

  StudentModel({required this.name, required this.skill, required this.education});

  factory StudentModel.fromJson(final json) {
    return StudentModel(name: json['name'], skill: json['skill'], education: json['education']);
  }
}