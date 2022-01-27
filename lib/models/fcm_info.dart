import 'package:intl/intl.dart';

class FCMInfo {
  late String _deviceId;
  late String _userId;
  late String _fcm;

  FCMInfo({
    required String deviceId,
    required String userId,
    required String fcm,
  }) {
    _fcm = fcm;
    _userId = userId;
    _deviceId = deviceId;
  }

  FCMInfo.fromFirebase(Map<String, dynamic> data, String deviceId) {
    _deviceId = deviceId;
    _fcm = data["fcm"];
    _userId = data["user_id"];
  }

  //the device that is using this userId and it's currently working
  //this variable will be our id
  String get deviceId => _deviceId;

  //the fcm token id getting from the firebase
  String get fcm => _fcm;

  //the user Id that this fcm is linked to
  String get userId => _userId;

  Map<String, dynamic> toMap() {
    return {
      "fcm": fcm,
      "created_at":
          DateFormat("yyyy-MM-dd hh:mm:ss", "en").format(DateTime.now()),
      "user_id": userId,
    };
  }

  @override
  String toString() =>
      'FCMInfo(_deviceId: $_deviceId, _userId: $_userId, _fcm: $_fcm)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FCMInfo &&
        other._deviceId == _deviceId &&
        other._userId == _userId &&
        other._fcm == _fcm;
  }

  @override
  int get hashCode => _deviceId.hashCode ^ _userId.hashCode ^ _fcm.hashCode;
}
