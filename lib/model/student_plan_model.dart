class StudentPlanModel {
  Map<String, List<CourseModel>> levels;

  StudentPlanModel({required this.levels});

  factory StudentPlanModel.fromJson(Map<String, dynamic> json) {
    Map<String, List<CourseModel>> levels = {};
    json.forEach((key, value) {
      List<CourseModel> courses = [];
      value.forEach((courseJson) {
        courses.add(CourseModel.fromJson(courseJson));
      });
      levels[key] = courses;
    });
    return StudentPlanModel(levels: levels);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    levels.forEach((key, value) {
      json[key] = value.map((course) => course.toJson()).toList();
    });
    return json;
  }
}

class CourseModel {
  String name;
  String status;

  CourseModel({required this.name, required this.status});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      name: json['name'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'status': status,
    };
  }
}
