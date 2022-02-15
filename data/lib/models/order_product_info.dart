class OrderProductInfo {
  late String _id;
  late String _orderId;
  late String _productId;
  late int _quantity;

  OrderProductInfo({
    required String id,
    required String orderId,
    required String productId,
    required int quantity,
  }) {
    _id = id;
    _orderId = orderId;
    _productId = productId;
    _quantity = quantity;
  }

  OrderProductInfo.fromFirebase(Map<String, dynamic> data, String id) {
    _id = id;
    _orderId = data["order_id"];
    _productId = data["product_id"];
    _quantity = data["quantity"];
  }

  //all the getters would be written here

  ///this field contains the product identifier
  String get id => _id;

  ///this field refer to the order of this product
  String get orderId => _orderId;

  ///the product id
  String get productId => _productId;

  ///the quantity of the product in this order
  int get quantity => _quantity;

  @override
  String toString() {
    return 'OrderProductInfo(id: $id, orderId: $orderId, productId: $productId, quantity: $quantity)';
  }
}
