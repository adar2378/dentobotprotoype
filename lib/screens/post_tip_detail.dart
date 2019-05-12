import 'package:dentobittest/model/health_tips.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';
import 'dart:async';
import 'dart:convert';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  HealthTip tip;

  final _formKey = GlobalKey<FormState>();
  String json_doc;
  ZefyrController _controller;
  NotusDocument text;
  FocusNode _focusNode;
  final document = new NotusDocument();
  @override
  void initState() {
    super.initState();

    _controller = new ZefyrController(document)
      ..addListener(() {
        setState(() {
         
        });
      });
    _focusNode = new FocusNode();
  }

  

  @override
  Widget build(BuildContext context) {
    final editor = ZefyrField(
      height: MediaQuery.of(context).size.height / 2, // set the editor's height
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: new BorderSide(),
          ),
          hintMaxLines: 1,
          // hintText: 'Write details',
          labelText: 'Description'),
      controller: _controller,
      focusNode: _focusNode,
      autofocus: false,

      physics: ClampingScrollPhysics(),
    );
    final form = ListView(
      key: _formKey,
      children: <Widget>[
        TextFormField(
            validator: (text) {
              if (text.length < 3) {
                return "Length must be at least 3";
              }
            },
            keyboardType:
                TextInputType.emailAddress, // Use email input type for emails.
            decoration: new InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: new BorderSide(),
                ),
                hintText: 'Write your title',
                labelText: 'Title')),
        SizedBox(
          height: 16,
        ),
        editor,
        // ZefyrView(document: _controller.document),
        SizedBox(
          height: 16,
        ),
        FlatButton(
            onPressed: () {},
            child: Text("Post"),
            color: Color(0xFF31C490),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Post"),
        backgroundColor: Color(0xFF32C692),
      ),
      body: ZefyrScaffold(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: form,
        ),
      ),
    );
  }
}
