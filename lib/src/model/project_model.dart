class ProjectModel {
  int? id;
  int? type;
  String? title;
  String? init;
  String? status;
  String? desc;
  String? image;
  bool? vertical;
  String? techStack;

  ProjectModel(
      {this.id,
      this.type,
      this.title,
      this.init,
      this.status,
      this.desc,
      this.image,
      this.vertical,
      this.techStack});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    init = json['init'];
    status = json['status'];
    desc = json['desc'];
    image = json['image'];
    vertical = json['vertical'];
    techStack = json['tech_stack'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['title'] = title;
    data['init'] = init;
    data['status'] = status;
    data['desc'] = desc;
    data['image'] = image;
    data['vertical'] = vertical;
    data['tech_stack'] = techStack;
    return data;
  }
}
