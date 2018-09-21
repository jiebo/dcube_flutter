class Project {
  String title;
  String description;

  factory Project(Map jsonMap) =>
      Project._fromJson(jsonMap);

  Project._fromJson(Map jsonMap) :
      title = jsonMap['title'],
      description = jsonMap['description'];
}