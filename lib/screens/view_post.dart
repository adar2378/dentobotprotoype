import 'package:dentobittest/model/health_tips.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ViewPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HealthTip args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.title,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Text(
            args.title,
            style: Theme.of(context).textTheme.title.copyWith(fontSize: 30),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Hero(
          tag: args.authorName,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 20,
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(args.authorName,
                        style: Theme.of(context).textTheme.subtitle),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "May 12",
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          child: Text(
            args.details,
            softWrap: true,
            style: Theme.of(context)
                .textTheme
                .subhead
                .copyWith(wordSpacing: 2, height: 1.5),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
          child: Wrap(
            spacing: 10,
            children: <Widget>[
              ActionChip(
                label: Text(args.serviceType),
                onPressed: () {},
              ),
              ActionChip(
                label: Text(args.serviceType),
                onPressed: () {},
              ),
              ActionChip(
                label: Text(args.serviceType),
                onPressed: () {},
              ),
            ],
          ),
        )
      ]),
    );
  }
}
