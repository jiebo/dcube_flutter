import 'package:flutter/material.dart';
import 'package:movies_flutter/util/projectprovider.dart';
import 'package:movies_flutter/util/utils.dart';
import 'package:movies_flutter/model/project.dart';
import 'package:movies_flutter/widgets/project_list/project_list.dart';
import 'package:movies_flutter/icons.dart';
import 'package:movies_flutter/colors.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  PageController _pageController;

  final ProjectProvider projectProvider = DCubeProjectProvider();
  List<Project> _projects = List();
  LoadingState _loadingState = LoadingState.LOADING;
  bool _isLoading = false;

  _loadProjects() async {
    _isLoading = true;

    try {
      var projects = await projectProvider.loadProjects();
      setState(() {
        _loadingState = LoadingState.DONE;
        _projects.addAll(projects);
        _isLoading = false;
      });
    } catch (e) {
      _isLoading = false;
      if (_loadingState == LoadingState.LOADING) {
        setState(() => _loadingState = LoadingState.ERROR);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = new Color(0xFFCCCCCC);
    final navigationItems = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
          icon: new Icon(LineAwesomeIcons.home, color: iconColor),
          title: new Text("Mobile")),
      new BottomNavigationBarItem(
          icon: new Icon(
            LineAwesomeIcons.bookmark,
            color: iconColor,
          ),
          title: new Text("Web"))
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("DCube")
      ),
      drawer: Drawer(
        child: ListView.builder(
            itemCount: _projects.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${_projects[index].title}'),
              );
            })
      ),
      body: PageView(
        children: _getProjectList(),
        pageSnapping: true,
        controller: _pageController,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: 0,
        items: navigationItems,
        onTap: (index) {},
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
    _loadProjects();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
