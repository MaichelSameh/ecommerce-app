enum Gender { male, female }

class MyUserInfo {
  MyUserInfo({
    required String email,
    required String id,
    required String name,
    required String profileImage,
  }) {
    _email = email;
    _id = id;
    _name = name;
    _profileImage = profileImage;
  }

  MyUserInfo.fromFirebase(Map<String, dynamic> data, String id) {
    _email = data["email"];
    _id = id;
    _name = data["name"];
    _profileImage = data["profile_image"];
  }

  late String _email;
  late String _id;
  late String _name;
  late String _profileImage;

  @override
  String toString() {
    return '''
      MyUserInfo(
        email: $email,
        id: $id,
        name: $name,
        "profilePicture: $profileImage,
      );
    ''';
  }

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "name": name,
      "profile_image": profileImage,
    };
  }

  //the email of the user
  String get email => _email;

  //the id of the user as it is in the firestore database
  String get id => _id;

  //the name of the user
  String get name => _name;

  //the profile image url
  String get profileImage => _profileImage;
}
