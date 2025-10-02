// To parse this JSON data, do
//
//     final blogsResponse = blogsResponseFromJson(jsonString);

import 'dart:convert';

BlogsResponse blogsResponseFromJson(String str) => BlogsResponse.fromJson(json.decode(str));

String blogsResponseToJson(BlogsResponse data) => json.encode(data.toJson());

class BlogsResponse {
  bool status;
  String message;
  BlogData data;

  BlogsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BlogsResponse.fromJson(Map<String, dynamic> json) => BlogsResponse(
    status: json["status"],
    message: json["message"],
    data: BlogData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class BlogData {
  int totalCount;
  int totalPages;
  int currentPage;
  int perPage;
  List<BlogsList> blogs;

  BlogData({
    required this.totalCount,
    required this.totalPages,
    required this.currentPage,
    required this.perPage,
    required this.blogs,
  });

  factory BlogData.fromJson(Map<String, dynamic> json) => BlogData(
    totalCount: json["total_count"],
    totalPages: json["total_pages"],
    currentPage: json["current_page"],
    perPage: json["per_page"],
    blogs: List<BlogsList>.from(json["blogs"].map((x) => BlogsList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_count": totalCount,
    "total_pages": totalPages,
    "current_page": currentPage,
    "per_page": perPage,
    "blogs": List<dynamic>.from(blogs.map((x) => x.toJson())),
  };
}

class BlogsList {
  int id;
  int clinicId;
  dynamic doctorId;
  String blogTitle;
  String? image;
  String descriptions;
  int blogCategoriesId;
  String tags;
  dynamic targetAudience;
  dynamic publishSettings;
  String status;
  int totalView;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  BlogsList({
    required this.id,
    required this.clinicId,
    required this.doctorId,
    required this.blogTitle,
    required this.image,
    required this.descriptions,
    required this.blogCategoriesId,
    required this.tags,
    required this.targetAudience,
    required this.publishSettings,
    required this.status,
    required this.totalView,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory BlogsList.fromJson(Map<String, dynamic> json) => BlogsList(
    id: json["id"],
    clinicId: json["clinic_id"],
    doctorId: json["doctor_id"],
    blogTitle: json["blog_title"],
    image: json["image"],
    descriptions: json["descriptions"],
    blogCategoriesId: json["blog_categories_id"],
    tags: json["tags"],
    targetAudience: json["target_audience"],
    publishSettings: json["publish_settings"],
    status: json["status"],
    totalView: json["total_view"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "clinic_id": clinicId,
    "doctor_id": doctorId,
    "blog_title": blogTitle,
    "image": image,
    "descriptions": descriptions,
    "blog_categories_id": blogCategoriesId,
    "tags": tags,
    "target_audience": targetAudience,
    "publish_settings": publishSettings,
    "status": status,
    "total_view": totalView,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deletedAt": deletedAt,
  };
}
