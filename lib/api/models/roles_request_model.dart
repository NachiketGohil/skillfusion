class RolesRequestModel {
  String? role;
  String? description;

  RolesRequestModel({this.role, this.description});

  RolesRequestModel.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = this.role;
    data['description'] = this.description;
    return data;
  }
}
