import 'dart:convert';

import 'package:flutter_getx_crud/models/product_model.dart';
import 'package:get/get_connect.dart';

import 'package:get/get.dart';

class ProductProvider extends GetConnect {
  String url = "https://flutter-firestore-535f2-default-rtdb.firebaseio.com/";

  Future<dynamic> postData(ProductModel productModel) async {
    final response = await post(url + "products.json", productModel.toJson());
    return response.body;
  }

  Future<dynamic> getData() async {
    final response = await get(url + "products.json");
    return response.body;
  }
}
