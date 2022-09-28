class ProjectsModel {
  int? id;
  int? type;
  String? title;
  String? init;
  String? status;
  String? desc;
  String? image;

  ProjectsModel(
      {this.id,
      this.type,
      this.title,
      this.init,
      this.status,
      this.desc,
      this.image});

  ProjectsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    init = json['init'];
    status = json['status'];
    desc = json['desc'];
    image = json['image'];
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
    return data;
  }
}
