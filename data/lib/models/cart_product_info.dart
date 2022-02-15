class CartProductInfo {
  late String _id;
  late String _userId;
  late String _productId;
  late int _quantity;

  CartProductInfo({
    required String id,
    required String userId,
    required String productId,
    required int quantity,
  }) {
    _id = id;
    _userId = userId;
    _productId = productId;
    _quantity = quantity;
  }

  CartProductInfo.fromFirebase(Map<String, dynamic> data, String id) {
    _id = id;
    _userId = data["user_id"];
    _productId = data["product_id"];
    _quantity = data["quantity"];
  }

  //all the getters would be written here

  ///this field contains the product identifier
  String get id => _id;

  ///this field refer to the owner of this product
  String get userId => _userId;

  ///the product id
  String get productId => _productId;

  ///the quantity of the product
  int get quantity => _quantity;

  @override
  String toString() {
    return '''
            CartProductInfo{
              id: $id,
              userId: $userId,
              productId: $productId,
              quantity: $quantity,
            }
          ''';
  }
}
