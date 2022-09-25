class ProjectsModel {
  int? id;
  int? type;
  String? title;
  String? est;
  String? until;
  String? desc;
  String? image;

  ProjectsModel(
      {this.id,
      this.type,
      this.title,
      this.est,
      this.until,
      this.desc,
      this.image});

  ProjectsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    est = json['est'];
    until = json['until'];
    desc = json['desc'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['title'] = title;
    data['est'] = est;
    data['until'] = until;
    data['desc'] = desc;
    data['image'] = image;
    return data;
  }
}
