import 'package:dentobittest/model/health_tips.dart';
import 'package:dentobittest/screens/post_tip_detail.dart';
import 'package:flutter/material.dart';

class HealthTips extends StatefulWidget {
  @override
  _HealthTipsState createState() => _HealthTipsState();
}

class _HealthTipsState extends State<HealthTips> {
  Widget getHealthTipCard(HealthTip tips) {
    Widget myColumn = Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Hero(
                tag: tips.authorName,
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
                        Text(tips.authorName,
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(color: Colors.purple)),
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
            ListTile(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/single_post',
                  arguments: tips,
                );
              },
              title: Text(tips.title),
              subtitle: Text(
                tips.details,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              isThreeLine: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Wrap(
                spacing: 10,
                children: <Widget>[
                  ActionChip(
                    label: Text(tips.serviceType),
                    onPressed: () {},
                  ),
                  ActionChip(
                    label: Text(tips.serviceType),
                    onPressed: () {},
                  ),
                  ActionChip(
                    label: Text(tips.serviceType),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ));

    return myColumn;
  }

  List<HealthTip> list = [
    HealthTip(
        title: "La la land!",
        authorName: "La la Auther 1",
        details:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        serviceType: "free tips"),
    HealthTip(
        title: "La la land!",
        authorName: "La la Auther 2",
        details:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        serviceType: "free tips"),
    HealthTip(
        title: "La la land!",
        authorName: "La la Auther 3",
        details:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        serviceType: "free tips"),
    HealthTip(
        title: "La la land!",
        authorName: "La la Auther 4",
        details:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        serviceType: "free tips"),
    HealthTip(
        title: "La la land!",
        authorName: "La la Auther 5",
        details:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        serviceType: "free tips"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/post');
        },
        child: Icon(Icons.edit),
        backgroundColor: Color(0xFF1CBF86),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return getHealthTipCard(list[index]);
        },
      ),
    );
  }
}
