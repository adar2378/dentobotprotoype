import 'package:dentobittest/model/course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseDetail extends StatefulWidget {
  CourseDetail({this.course});
  final Course course;
  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
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
    return Scaffold(
      backgroundColor: Color(0xFF2EA882),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(widget.course.title,
                style: TextStyle(
                  color: Colors.white,
                )),
            centerTitle: true,
            backgroundColor: Colors.green,
            expandedHeight: 350.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                  tag: widget.course.title,
                  child: Image.asset(widget.course.coverImageUrl,
                      fit: BoxFit.cover)),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              Card(
                margin: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                 padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Instructors",
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(getDoctorName(widget.course.instructors),
                          style: TextStyle(fontSize: 16)),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                       SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Details",
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(widget.course.details, style: TextStyle(fontSize: 16)),
                       SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ])),
          )
        ],
      ),
    );
    ;
  }
}
