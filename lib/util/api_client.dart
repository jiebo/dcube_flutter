import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:movies_flutter/model/project.dart';

class ApiClient {
  static final _client = ApiClient._internal();
  final _http = HttpClient();

  ApiClient._internal();

  final String baseUrl = 'api.themoviedb.org';
  final String jsonUrl = 'raw.githubusercontent.com';

  factory ApiClient() => _client;

  Future<dynamic> _getJson(Uri uri) async {
    var response = await (await _http.getUrl(uri)).close();
    var transformedResponse = await response.transform(utf8.decoder).join();
    return json.decode(transformedResponse);
  }

  // DCube Projects
  Future<List<Project>> loadProjects() {
    var url = Uri.https(
        jsonUrl, "jiebo/dcube_flutter/master/assets/dcube_projects.json");
    return _getJson(url).then((json) => json['projects']).then(
        (data) => data.map<Project>((item) => Project.fromJson(item)).toList());
  }
}
