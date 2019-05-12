import 'package:dentobittest/screens/courses_page.dart';
import 'package:dentobittest/screens/find_dentist.dart';
import 'package:dentobittest/screens/health_tips.dart';
import 'package:dentobittest/screens/post_tip_detail.dart';
import 'package:dentobittest/screens/view_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Route _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/post':
        return _buildRoute(settings, CreatePost());
      case '/single_post':
        return _buildRoute(settings, ViewPost());
      default:
        return _buildRoute(settings, MyHomePage());
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dentobit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        var data = MediaQuery.of(context).copyWith(textScaleFactor: 1);
        return MediaQuery(
          data: data,
          child: Navigator(
            initialRoute: "/",
            onGenerateRoute: _getRoute,
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  PageController pageController;

  String appbarText;
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    appbarText = "Courses";

    pageController = PageController(initialPage: 0);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 1, end: 0).animate(_animationController)
      ..addListener(() {
        print(_animationController.value);
        setState(() {});
      });
    _animationController.value = 1;

    _animationController.addStatusListener(statusListener);
  }

  String selectedButton = "courses";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Opacity(
              opacity: _animationController.value,
              child: child,
            );
          },
          child: Text(
            appbarText,
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color(0xFF1BC188),
      ),
      body: Container(
        color: Colors.white,
        child: PageView(
          controller: pageController,
          children: <Widget>[
            CoursePage(),
            HealthTips(),
            FindDentist(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "Find Dentist",
          style: TextStyle(
              color:
                  selectedButton == "search" ? Colors.white : Colors.white54),
        ),
        icon: Icon(
          Icons.search,
          color: selectedButton == "search" ? Colors.white : Colors.white54,
        ),
        backgroundColor: Color(0xFF297DC0),
        onPressed: () {
          _animationController.reset();
          _animationController.forward();
          pageController.jumpToPage(
            2,
          );
          setState(() {
            selectedButton = "search";
            appbarText = "Find Dentist";
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF1BC188),
        // shape: CircularNotchedRectangle(),
        elevation: 0,
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.layers),
              color:
                  selectedButton == "courses" ? Colors.white : Colors.white54,
              onPressed: () {
                _animationController.reset();
                _animationController.forward();
                pageController.jumpToPage(
                  0,
                );
                setState(() {
                  selectedButton = "courses";
                  appbarText = "Courses";
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.list),
              color: selectedButton == "registration"
                  ? Colors.white
                  : Colors.white54,
              onPressed: () {
                _animationController.reset();
                _animationController.forward();
                pageController.jumpToPage(
                  1,
                );
                setState(() {
                  selectedButton = "registration";
                  appbarText = "Health Tips";
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void statusListener(AnimationStatus status) {
    print(status);
    if (status == AnimationStatus.dismissed) {
      _animationController.forward();
      // _animationController.reverse();
    }
  }
}
