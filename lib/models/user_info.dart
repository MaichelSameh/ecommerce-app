import 'package:intl/intl.dart';

enum Gender { male, female }

class MyUserInfo {
  MyUserInfo({
    required String email,
    required String id,
    required String firstName,
    required String lastName,
    required Gender gender,
    required DateTime dateOfBirth,
    required String userTypeId,
    required String profileImage,
  }) {
    _email = email;
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _gender = gender;
    _dateOfBirth = dateOfBirth;
    _userTypeId = userTypeId;
    _profileImage = profileImage;
  }

  MyUserInfo.fromFirebase(Map<String, dynamic> data, String id) {
    _email = data["email"];
    _id = id;
    _firstName = data["first_name"];
    _lastName = data["last_name"];
    _gender = data["gender"] == "male" ? Gender.male : Gender.female;
    _profileImage = data["profile_image"];
    _dateOfBirth = DateTime.parse(data["date_of_birth"]);
    _userTypeId = data["user_type"];
  }

  late String _email;
  late String _id;
  late String _firstName;
  late String _lastName;
  late Gender _gender;
  late DateTime _dateOfBirth;
  late String phoneNumber;
  late String _userTypeId;
  late String _profileImage;

  @override
  String toString() {
    return '''
      MyUserInfo(
        email: $email,
        id: $id,
        profilePicture: $profileImage,
        firstName: $firstName,
        lastName: $lastName,
        gender: ${gender.name},
        dateOfBirth: $dateOfBirth,
        userTypeId: $userTypeId,
      );
    ''';
  }

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "gender": gender.name,
      "date_of_birth": DateFormat("yyyy-MM-dd", "en").format(dateOfBirth),
      "created_at": DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now()),
      "user_type_id": userTypeId,
      "profile_image": profileImage,
    };
  }

  //the email of the user
  String get email => _email;

  //the id of the user as it is in the firestore database
  String get id => _id;

  //the first name of the user
  String get firstName => _firstName;

  //the last name of the user
  String get lastName => _lastName;

  //the user gender
  Gender get gender => _gender;

  //the user's date of birth
  DateTime get dateOfBirth => _dateOfBirth;

  //the user type id
  ///this instance is refiring to another class by Id to connect between then
  String get userTypeId => _userTypeId;

  //the profile image url
  String get profileImage => _profileImage;
}
