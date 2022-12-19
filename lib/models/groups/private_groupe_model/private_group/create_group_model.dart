class CreateGroupModel {
  CreateGroupModel({
    required this.data,
    required this.message,
    required this.status,
    this.pagination,
  });
  late final List<dynamic> data;
  late final String message;
  late final bool status;
  late final Null pagination;

  CreateGroupModel.fromJson(Map<String, dynamic> json){
    data = List.castFrom<dynamic, dynamic>(json['data']);
    message = json['message'];
    status = json['status'];
    pagination = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data;
    _data['message'] = message;
    _data['status'] = status;
    _data['pagination'] = pagination;
    return _data;
  }
}