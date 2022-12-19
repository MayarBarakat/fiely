class FileDetailsModel {
  Data? data;
  String? message;
  bool? status;
  Null? pagination;

  FileDetailsModel({this.data, this.message, this.status, this.pagination});

  FileDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
    pagination = json['pagination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    data['pagination'] = this.pagination;
    return data;
  }
}

class Data {
  int? fileId;
  String? fileName;
  String? fileType;
  String? fileSize;
  String? fileImage;

  Data(
      {this.fileId,
        this.fileName,
        this.fileType,
        this.fileSize,
        this.fileImage});

  Data.fromJson(Map<String, dynamic> json) {
    fileId = json['file-id'];
    fileName = json['file-name'];
    fileType = json['file-type'];
    fileSize = json['file-size'];
    fileImage = json['file-image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file-id'] = this.fileId;
    data['file-name'] = this.fileName;
    data['file-type'] = this.fileType;
    data['file-size'] = this.fileSize;
    data['file-image'] = this.fileImage;
    return data;
  }
}
