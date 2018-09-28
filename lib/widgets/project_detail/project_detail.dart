import 'package:flutter/material.dart';
import 'package:movies_flutter/model/project.dart';
import 'package:movies_flutter/scoped_models/app_model.dart';
import 'package:movies_flutter/util/api_client.dart';
import 'package:movies_flutter/util/projectprovider.dart';
import 'package:movies_flutter/util/styles.dart';
import 'package:movies_flutter/widgets/utilviews/bottom_gradient.dart';
import 'package:scoped_model/scoped_model.dart';

class ProjectDetailScreen extends StatefulWidget {
  final Project _project;
  final ProjectProvider provider;
  final ApiClient _apiClient = new ApiClient();

  ProjectDetailScreen(this._project, this.provider);

  @override
  ProjectDetailScreenState createState() {
    return ProjectDetailScreenState();
  }
}

class ProjectDetailScreenState extends State<ProjectDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary,
        body: CustomScrollView(slivers: <Widget>[
          _buildAppBar(widget._project),
          _buildContentSection(widget._project)
        ]));
  }

  Widget _buildAppBar(Project project) {
    return SliverAppBar(
      expandedHeight: 240.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: "Project-Tag-${widget._project.title}",
              child: FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: "assets/placeholder.jpg",
                  image: widget._project.imagePath),
            ),
            BottomGradient(),
          ],
        ),
      ),
    );
  }

  Widget _buildContentSection(Project project) {
    return SliverList(
      delegate: SliverChildListDelegate(<Widget>[
        Container(
          decoration: BoxDecoration(color: const Color(0xff222128)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "SYNOPSIS",
                  style: const TextStyle(color: Colors.white),
                ),
                Container(
                  height: 8.0,
                ),
                Text(project.description,
                    style:
                        const TextStyle(color: Colors.white, fontSize: 12.0)),
                Container(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
