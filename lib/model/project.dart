class Project {
  final String title;
  final String description;
  final String imagePath;

  const Project({this.title, this.description, this.imagePath});

  Project.fromJson(Map jsonMap)
      : this.title = jsonMap['title'],
        this.description = jsonMap['description'],
        this.imagePath = jsonMap['image_path'];
}
