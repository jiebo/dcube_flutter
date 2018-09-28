import 'package:flutter/material.dart';
import 'package:movies_flutter/model/project.dart';
import 'package:movies_flutter/util/projectprovider.dart';
import 'package:movies_flutter/widgets/project_detail/project_detail.dart';

goToProjectDetails(BuildContext context, Project project) {
  _pushWidgetWithFade(
      context, ProjectDetailScreen(project, DCubeProjectProvider()));
}

_pushWidgetWithFade(BuildContext context, Widget widget) {
  Navigator.of(context).push(
        PageRouteBuilder(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
            pageBuilder: (BuildContext context, Animation animation,
                Animation secondaryAnimation) {
              return widget;
            }),
      );
}
