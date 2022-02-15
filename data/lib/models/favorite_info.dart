class FavoriteInfo {
  late String _userId;
  late String _productId;

  FavoriteInfo({
    required String userId,
    required String productId,
  }) {
    _userId = userId;
    _productId = productId;
  }

  ///the user who likes this product
  String get userId => _userId;

  ///the liked product
  String get productId => _productId;

  @override
  String toString() => 'FavoriteInfo(userId: $userId, productId: $productId)';
}
