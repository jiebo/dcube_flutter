import 'package:flutter/material.dart';
import 'package:movies_flutter/model/project.dart';
import 'package:movies_flutter/util/navigator.dart';

class ProjectListItem extends StatelessWidget {
  ProjectListItem(this.project);

  final Project project;

  Widget _getTitleSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    project.title,
                    style: Theme
                        .of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 12.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => goToProjectDetails(context, project),
        child: Column(
          children: <Widget>[
            Hero(
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/placeholder.jpg",
                  image: project.imagePath,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  height: 200.0,
                  fadeInDuration: Duration(milliseconds: 50),
                ),
                tag: "Project-Tag-${project.title}"
            ),
            _getTitleSection(context),
          ],
        ),
      ),
    );
  }
}
