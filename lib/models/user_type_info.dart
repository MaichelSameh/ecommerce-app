import 'package:intl/intl.dart';

class UserTypeInfo {
  late String _id;
  late String _type;
  late bool _accessible;

  UserTypeInfo({
    required String id,
    required String type,
    required bool accessible,
  }) {
    _id = id;
    _type = type;
    _accessible = accessible;
  }

  UserTypeInfo.fromFirebase(Map<String, dynamic> data, String id) {
    id = id;
    _type = data["type"];
    _accessible = data["accessible"];
  }

  //the id of the user type
  String get id => _id;

  //the type of the user
  String get type => _type;

  //if this type can be used or not
  bool get accessible => _accessible;

  Map<String, dynamic> toMap() {
    return {
      "type": type,
      "accessible": accessible,
      "created_at": DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now()),
    };
  }

  @override
  String toString() =>
      'UserTypeInfo(_id: $_id, _type: $_type, _accessible: $_accessible)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserTypeInfo &&
        other._id == _id &&
        other._type == _type &&
        other._accessible == _accessible;
  }

  @override
  int get hashCode => _id.hashCode ^ _type.hashCode ^ _accessible.hashCode;
}
