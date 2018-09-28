import 'dart:async';

import 'package:movies_flutter/model/project.dart';
import 'package:movies_flutter/util/api_client.dart';

abstract class ProjectProvider {
  Future<List<Project>> loadProjects();
}

class DCubeProjectProvider extends ProjectProvider {
  DCubeProjectProvider();

  ApiClient _apiClient = ApiClient();

  @override
  Future<List<Project>> loadProjects() {
    return _apiClient.loadProjects();
  }
}
