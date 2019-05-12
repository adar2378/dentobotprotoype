import 'package:dentobittest/screens/course_detail.dart';
import 'package:flutter/material.dart';
import 'package:dentobittest/model/course.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  List<Course> coursesList = List<Course>();
  @override
  void initState() {
    super.initState();
    coursesList.add(
      Course(
          title: "Course 1",
          coverImageUrl: "assets/image.jpg",
          instructors: List.unmodifiable([
            "Dr. Hoho",
            "Dr. Haha",
          ]),
          details:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
    );
    coursesList.add(
      Course(
          title: "Why so serious? Keep smiling",
          coverImageUrl: "assets/image.jpg",
          instructors: List.unmodifiable([
            "Dr. Hoho",
            "Dr. Haha",
          ]),
          details: "Good course for dentists."),
    );
    coursesList.add(
      Course(
          title: "Magic beam! Laser! pew pew pew!",
          coverImageUrl: "assets/image.jpg",
          instructors: List.unmodifiable([
            "Dr. Hoho",
            "Dr. Haha",
          ]),
          details: "Good course for dentists."),
    );
  }

  String getDoctorName(List<String> list) {
    String resultString = "";
    for (int i = 0; i < list.length; i++) {
      if (i == list.length - 1) {
        resultString += list[i];
      } else {
        resultString += list[i] + ", ";
      }
    }
    return resultString;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        key: PageStorageKey("course"),
        shrinkWrap: true,
        itemExtent: 230,
        itemCount: coursesList.length,
        itemBuilder: (context, index) {
          return Stack(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: <Widget>[
                      Hero(
                        tag: coursesList[index].title,
                        child: Image.asset(
                          coursesList[index].coverImageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                                colors: [
                              Colors.transparent,
                              Colors.black54,
                              Colors.black87
                            ],
                                stops: [
                              0,
                              .5,
                              1
                            ])),
                      ),
                      Positioned(
                        left: 16,
                        bottom: 40,
                        right: 16,
                        child: Text(
                          coursesList[index].title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 12,
                          left: 16,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              Text(
                                  getDoctorName(coursesList[index].instructors),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ))
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                )),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CourseDetail(course: coursesList[index])));
                },
                color: Colors.green.shade600,
                child: Text(
                  "View more",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ]);
        },
      ),
    );
  }
}
