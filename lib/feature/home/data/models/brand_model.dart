class BrandModel {
  final String name;
  final int? id;

  const BrandModel({ required this.name, this.id});

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      BrandModel(name: json['name'] as String, id: json['id'] as int?);
}
