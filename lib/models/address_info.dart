import 'package:intl/intl.dart';

class AddressInfo {
  late String _address;
  late String _id;
  late double? _lat;
  late double? _long;
  late String _userId;

  //the user readable address
  //we can replace it with something else, but just leave it like that for now
  String get address => _address;

  //the address id as it's in the database
  String get id => _id;

  //the latitude of the location, for more accuracy
  double? get lat => _lat;

  //the longitude of the location, for more accuracy
  double? get long => _long;

  //the user id to be represent the user
  String get userId => _userId;

  AddressInfo({
    required String address,
    required String userId,
    required String id,
    double? lat,
    double? long,
  }) {
    _address = address;
    _id = id;
    _lat = lat;
    _long = long;
    _userId = userId;
  }

  AddressInfo.fromFirebase(Map<String, dynamic> data, String id) {
    _address = data["address"];
    _id = id;
    _lat = data["lat"];
    _long = data["ong"];
    _userId = data["user_id"];
  }

  Map<String, dynamic> toMap() {
    return {
      "address": address,
      "user_id": userId,
      "created_at": DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now()),
      if (lat != null) "lat": lat,
      if (long != null) "long": long,
    };
  }

  @override
  String toString() {
    return 'AddressInfo(address: $address, id: $id, lat: $lat, long: $long, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddressInfo &&
        other._address == _address &&
        other._id == _id &&
        other._lat == _lat &&
        other._long == _long &&
        other._userId == _userId;
  }

  @override
  int get hashCode {
    return _address.hashCode ^
        _id.hashCode ^
        _lat.hashCode ^
        _long.hashCode ^
        _userId.hashCode;
  }
}
