class CategoryModel {
  final String? name;
  final String? pictureUrl;
  final int? id;

  const CategoryModel({this.name, this.pictureUrl, this.id});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    name: json['name'] as String?,
    pictureUrl: json['pictureUrl'] as String?,
    id: json['id'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'pictureUrl': pictureUrl,
    'id': id,
  };
}
