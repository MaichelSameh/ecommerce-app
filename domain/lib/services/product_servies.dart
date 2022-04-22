import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/models/product_info.dart';

import '../config/config.dart';
import '../interfaces/general_data_interface.dart';

class ProductServices with GeneralDataInterface<ProductInfo> {
  CollectionReference<Map<String, dynamic>> instance =
      FirebaseFirestore.instance.collection(FirebaseConfig.products_path);
  @override
  Future<List<ProductInfo>> getAll() async {
    try {
      List<ProductInfo> products = <ProductInfo>[];
      QuerySnapshot<Map<String, dynamic>> res = await instance.get();
      for (var item in res.docs) {
        products.add(ProductInfo.fromFirebase(item.data(), item.id, false));
      }
      return products;
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  @override
  Future<ProductInfo> getById({required String id}) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> res = await instance.doc(id).get();
      if (!res.exists) {
        throw "Product not found";
      }
      return ProductInfo.fromFirebase(res.data()!, id, false);
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
