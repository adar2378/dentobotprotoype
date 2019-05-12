import 'package:flutter/material.dart';

class FindDentist extends StatefulWidget {
  @override
  _FindDentistState createState() => _FindDentistState();
}

class _FindDentistState extends State<FindDentist> with AutomaticKeepAliveClientMixin {
  List<DropdownMenuItem> list = [
    DropdownMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.place),
            SizedBox(
              width: 10,
            ),
            Text("Dhaka"),
          ],
        ),
        value: "1"),
    DropdownMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.place),
            SizedBox(
              width: 10,
            ),
            Text("Comilla Comilla Comilla Comilla"),
          ],
        ),
        value: "2"),
    DropdownMenuItem(
        child: Row(
          children: <Widget>[
            Icon(Icons.place),
            SizedBox(
              width: 10,
            ),
            Text("Chittagong"),
          ],
        ),
        value: "3"),
    DropdownMenuItem(
        child: Row(
          children: <Widget>[
            Icon(Icons.place),
            SizedBox(
              width: 10,
            ),
            Text("Rajshahi"),
          ],
        ),
        value: "4"),
    DropdownMenuItem(
        child: Row(
          children: <Widget>[
            Icon(Icons.place),
            SizedBox(
              width: 10,
            ),
            Text("Sylhet"),
          ],
        ),
        value: "5"),
  ];

  List<DropdownMenuItem> listFees = [
    DropdownMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.monetization_on),
            SizedBox(
              width: 10,
            ),
            Text("500"),
          ],
        ),
        value: "1"),
    DropdownMenuItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.monetization_on),
            SizedBox(
              width: 10,
            ),
            Text("1000"),
          ],
        ),
        value: "2"),
    DropdownMenuItem(
        child: Row(
          children: <Widget>[
            Icon(Icons.monetization_on),
            SizedBox(
              width: 10,
            ),
            Text("1000"),
          ],
        ),
        value: "3"),
    DropdownMenuItem(
        child: Row(
          children: <Widget>[
            Icon(Icons.monetization_on),
            SizedBox(
              width: 10,
            ),
            Text("1000"),
          ],
        ),
        value: "4"),
    DropdownMenuItem(
        child: Row(
          children: <Widget>[
            Icon(Icons.monetization_on),
            SizedBox(
              width: 10,
            ),
            Text("1000"),
          ],
        ),
        value: "5"),
  ];

  String _value = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DropdownButton(
                  hint: Text("Location"),
                  items: list,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  value: _value,
                ),
                DropdownButton(
                  hint: Text("Fee"),
                  items: listFees,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  value: _value,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: DropdownButton(
              hint: Text("Speciallity"),
              items: list,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
              value: _value,
              isExpanded: true,
            ),
          ),
          FlatButton(
            color: Color(0x661CBF86),
            onPressed: () {},
            child: Text("Search"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  color: Color(0x661CBF86),
                  margin: EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "ডঃ হাসান মাহমুদ",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Tooth destructor",
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "+8801730-00000$index",
                          style: Theme.of(context).textTheme.body1,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          " বশুন্ধারা গেট, ঢাকা",
                          style: Theme.of(context).textTheme.body1,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
