class Course {
  String title;
  String coverImageUrl;
  List<String> instructors;
  String details;

  Course({this.title, this.coverImageUrl, this.instructors, this.details});

  get getTitle => title;
  get getCoverImageUrl => coverImageUrl;
  get getInstructors => instructors;
  get getDetails => details;
}
