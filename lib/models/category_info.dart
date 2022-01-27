import 'package:intl/intl.dart';

class CategoryInfo {
  CategoryInfo({
    required DateTime createdAt,
    required String description,
    required String id,
    required String name,
    required String coverImage,
  }) {
    _createdAt = createdAt;
    _description = description;
    _id = id;
    _name = name;
    _coverImage = coverImage;
  }

  CategoryInfo.fromFirebase(Map<String, dynamic> data, String id) {
    _createdAt = DateTime.parse(data["created_at"]);
    _description = data["description"];
    _id = id;
    _name = data["name"];
    //We are expecting this field to be empty some times
    _coverImage = data["cover_image"] ?? "";
  }

  late DateTime _createdAt;
  late String _description;
  late String _id;
  late String _name;
  late String _coverImage;

  @override
  String toString() {
    return '''
      CategoryInfo(
        createdAt: $createdAt,
        description: $description,
        id: $id,
        name: $name,
        coverImage: $coverImage,
      );
    ''';
  }

  //the category's date of creation
  DateTime get createdAt => _createdAt;

  //the description of the category
  String get description => _description;

  //the is of the category as it is in the firestore database
  String get id => _id;

  //the name of the category
  String get name => _name;

  //the cover image for an category is used to render the UI more comfortable for the user
  String get coverImage => _coverImage;

  Map<String, dynamic> toMap() {
    return {
      "created_at": DateFormat("yyyy-MM-dd hh:mm:ss", "en").format(createdAt),
      "description": description,
      "name": name,
      if (coverImage.isNotEmpty) "cover_image": coverImage,
    };
  }
}
