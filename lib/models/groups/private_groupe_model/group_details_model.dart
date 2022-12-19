class GroupDetailsModel {
  Data? data;
  String? message;
  bool? status;
  Pagination? pagination;

  GroupDetailsModel({this.data, this.message, this.status, this.pagination});

  GroupDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Data {
  List<GroupMembers>? groupMembers;
  List<GroupFiles>? groupFiles;

  Data({this.groupMembers, this.groupFiles});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['group-members'] != null) {
      groupMembers = <GroupMembers>[];
      json['group-members'].forEach((v) {
        groupMembers!.add(new GroupMembers.fromJson(v));
      });
    }
    if (json['group-files'] != null) {
      groupFiles = <GroupFiles>[];
      json['group-files'].forEach((v) {
        groupFiles!.add(new GroupFiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.groupMembers != null) {
      data['group-members'] =
          this.groupMembers!.map((v) => v.toJson()).toList();
    }
    if (this.groupFiles != null) {
      data['group-files'] = this.groupFiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GroupMembers {
  int? id;
  String? name;

  GroupMembers({this.id, this.name});

  GroupMembers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class GroupFiles {
  int? fileId;
  String? fileName;
  String? fileStatus;
  String? fileImage;

  GroupFiles({this.fileId, this.fileName, this.fileStatus, this.fileImage});

  GroupFiles.fromJson(Map<String, dynamic> json) {
    fileId = json['file-id'];
    fileName = json['file-name'];
    fileStatus = json['file-status'];
    fileImage = json['file-image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file-id'] = this.fileId;
    data['file-name'] = this.fileName;
    data['file-status'] = this.fileStatus;
    data['file-image'] = this.fileImage;
    return data;
  }
}

class Pagination {
  int? currentPage;
  Null? nextPageUrl;

  Pagination({this.currentPage, this.nextPageUrl});

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    nextPageUrl = json['next_page_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['next_page_url'] = this.nextPageUrl;
    return data;
  }
}
