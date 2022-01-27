import 'package:intl/intl.dart';

class BrandInfo {
  late String _id;
  late String _categoryId;
  late String _name;
  late String _logo;

  BrandInfo({
    required String id,
    required String categoryId,
    required String name,
    required String logo,
  }) {
    _id = id;
    _categoryId = categoryId;
    name = name;
    logo = logo;
  }

  BrandInfo.fromFirebase(Map<String, dynamic> data, String id) {
    _id = id;
    _categoryId = data["category_id"];
    _name = data["name"];
    _logo = data["logo"];
  }

  //the id of the brand in the database
  String get id => _id;

  //the category that represent the parent of this brand
  String get categoryId => _categoryId;

  //the name of the brand
  String get title => _name;

  //the logo of the brand
  String get logo => _logo;

  Map<String, dynamic> toMap() {
    return {
      "category_id": categoryId,
      "name": title,
      "logo": logo,
      "created_at": DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now()),
    };
  }

  @override
  String toString() {
    return 'BrandInfo(_id: $_id, _categoryId: $_categoryId, _name: $_name, _logo: $_logo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BrandInfo &&
        other._id == _id &&
        other._categoryId == _categoryId &&
        other._name == _name &&
        other._logo == _logo;
  }

  @override
  int get hashCode {
    return _id.hashCode ^
        _categoryId.hashCode ^
        _name.hashCode ^
        _logo.hashCode;
  }
}
