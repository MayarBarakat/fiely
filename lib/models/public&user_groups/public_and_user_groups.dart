class PublicAndUserGroups {
  Data? data;
  String? message;
  bool? status;
  Pagination? pagination;

  PublicAndUserGroups({this.data, this.message, this.status, this.pagination});

  PublicAndUserGroups.fromJson(Map<String, dynamic> json) {
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
  List<Groups>? groups;
  List<PublicGroupFiles>? publicGroupFiles;

  Data({this.groups, this.publicGroupFiles});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['groups'] != null) {
      groups = <Groups>[];
      json['groups'].forEach((v) {
        groups!.add(new Groups.fromJson(v));
      });
    }
    if (json['public-group-files'] != null) {
      publicGroupFiles = <PublicGroupFiles>[];
      json['public-group-files'].forEach((v) {
        publicGroupFiles!.add(new PublicGroupFiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.groups != null) {
      data['groups'] = this.groups!.map((v) => v.toJson()).toList();
    }
    if (this.publicGroupFiles != null) {
      data['public-group-files'] =
          this.publicGroupFiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Groups {
  int? groupId;
  String? groupName;
  String? groupType;
  String? groupImage;

  Groups({this.groupId, this.groupName, this.groupType, this.groupImage});

  Groups.fromJson(Map<String, dynamic> json) {
    groupId = json['group-id'];
    groupName = json['group-name'];
    groupType = json['group-type'];
    groupImage = json['group-image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['group-id'] = this.groupId;
    data['group-name'] = this.groupName;
    data['group-type'] = this.groupType;
    data['group-image'] = this.groupImage;
    return data;
  }
}

class PublicGroupFiles {
  int? fileId;
  String? fileName;
  String? fileStatus;
  String? fileImage;

  PublicGroupFiles(
      {this.fileId, this.fileName, this.fileStatus, this.fileImage});

  PublicGroupFiles.fromJson(Map<String, dynamic> json) {
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
