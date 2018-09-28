import 'package:flutter/material.dart';
import 'package:movies_flutter/model/project.dart';
import 'package:movies_flutter/util/projectprovider.dart';
import 'package:movies_flutter/util/utils.dart';
import 'package:movies_flutter/widgets/project_list/project_list_item.dart';

class ProjectList extends StatefulWidget {
  ProjectList(this.provider, {Key key}) : super(key: key);

  final ProjectProvider provider;

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  List<Project> _projects = List();
  LoadingState _loadingState = LoadingState.LOADING;
  bool _isLoading = false;

  _loadProjects() async {
    _isLoading = true;
    try {
      var asyncProjects =
          await widget.provider.loadProjects();
      setState(() {
        _loadingState = LoadingState.DONE;
        _projects.addAll(asyncProjects);
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
  void initState() {
    super.initState();
    _loadProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: _getContentSection());
  }

  Widget _getContentSection() {
    switch (_loadingState) {
      case LoadingState.DONE:
        return ListView.builder(
            itemCount: _projects.length,
            itemBuilder: (BuildContext context, int index) {
              return ProjectListItem(_projects[index]);
            });
      case LoadingState.ERROR:
        return Text('Sorry, there was an error loading the data!');
      case LoadingState.LOADING:
        return CircularProgressIndicator();
      default:
        return Container();
    }
  }
}
