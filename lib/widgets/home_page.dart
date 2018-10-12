import 'package:flutter/material.dart';
import 'package:movies_flutter/util/projectprovider.dart';
import 'package:movies_flutter/widgets/project_list/project_list.dart';
import 'package:movies_flutter/icons.dart';
import 'package:movies_flutter/colors.dart';
import 'camera_page.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  PageController _pageController;
  int _currentIndex = 0;
  final ProjectProvider projectProvider = DCubeProjectProvider();

  @override
  Widget build(BuildContext context) {
    final iconColor = new Color(0xFFCCCCCC);
    final navigationItems = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
          icon: new Icon(LineAwesomeIcons.home, color: iconColor),
          title: new Text("Mobile")),
      new BottomNavigationBarItem(
          icon: new Icon(LineAwesomeIcons.bookmark, color: iconColor),
          title: new Text("Web")),
      new BottomNavigationBarItem(
          icon: new Icon(
            LineAwesomeIcons.bookmark,
            color: iconColor,
          ),
          title: new Text("Camera"))
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("DCube"),
      ),
      body: PageView(
        children: _getProjectList(),
        pageSnapping: true,
        controller: _pageController,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: 0,
        items: navigationItems,
        onTap: (index) {
          setState(() {
                      _currentIndex = index;
                    });
          print(_currentIndex.toString());
          if (index == 2){
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => new CameraApp()),
  );
          }
        },
        fixedColor: ProfileColors.primaryColor,
        iconSize: 25.0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  List<Widget> _getProjectList() {
    return <Widget>[ProjectList(projectProvider, key: Key("projects"))];
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
