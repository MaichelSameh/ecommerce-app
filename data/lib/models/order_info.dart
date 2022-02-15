class OrderInfo {
  late String _coverImage;
  late DateTime _createdAt;
  late String _id;
  late String _orderStatus;
  late int _totalPrice;
  late String _userId;

  OrderInfo({
    required String coverImage,
    required DateTime createdAt,
    required String id,
    required String orderStatus,
    required int totalPrice,
    required String userId,
  }) {
    _coverImage = coverImage;
    _createdAt = createdAt;
    _id = id;
    _orderStatus = orderStatus;
    _totalPrice = totalPrice;
    _userId = userId;
  }

  OrderInfo.fromFirebase(Map<String, dynamic> data, String id) {
    _coverImage = data["cover_image"];
    _createdAt = DateTime.parse(data["created_at"]);
    _id = id;
    _orderStatus = data["order_status"];
    _totalPrice = data["total_price"];
    _userId = data["user_id"];
  }

  //all the getters would be written here

  ///the image to display on the order container
  String get coverImage => _coverImage;

  ///the date when this order was created
  DateTime get createdAt => _createdAt;

  ///the identifier of this order
  String get id => _id;

  ///the order's current status
  String get orderStatus => _orderStatus;

  ///the total price for this order
  int get totalPrice => _totalPrice;

  ///the owner of this order
  String get userId => _userId;

  @override
  String toString() {
    return 'OrderInfo(coverImage: $coverImage, createdAt: $createdAt, id: $id, orderStatus: $orderStatus, totalPrice: $totalPrice, userId: $userId)';
  }
}
