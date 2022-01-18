import 'dart:convert';

import 'package:flutter_getx_crud/models/product_model.dart';
import 'package:flutter_getx_crud/providers/product_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductController extends GetxController {
  late TextEditingController txtName = TextEditingController();
  late TextEditingController txtStock = TextEditingController();

  var products = List<ProductModel>.empty().obs;
  var isLoading = true.obs;

  ProductController() {
    ProductProvider().getData().then((response) {
      isLoading.value = false;
      if (response != null) {
        Map<String, dynamic> mapData = Map<String, dynamic>.from(response);
        mapData.forEach((key, value) {
          var data = ProductModel(
              id: key,
              name: value['name'],
              stock: value['stock'],
              createdAt: value['created_at']);
          products.add(data);
        });
      }
      //print(mapData);
    });
    update();
  }

  void add(String name, String stock) {
    if (name != '') {
      final createdAt = DateTime.now().toIso8601String();
      final data = ProductModel(name: name, stock: stock, createdAt: createdAt);
      products.add(data);
      txtName.text = '';
      txtStock.text = '';
      ProductProvider().postData(data).then((value) => print(value));
      Get.back();
    } else {
      dialogError("Nama tidak boleh kosong");
    }
  }

  void dialogError(String msg) {
    Get.defaultDialog(title: 'Terjadi Kesalahan', content: Text(msg));
  }

  ProductModel findById(String id) {
    return products.firstWhere((element) => element.id == id);
  }

  void edit(String id, String name, String stock) {
    ProductModel model = this.findById(id);
    model.name = name;
    model.stock = stock;
    ProductProvider()
        .update(id, name, stock)
        .then((value) => {products.refresh()});
    Get.back();
  }

  void delete(String id) {
    ProductProvider().deleteData(id).then((_) =>
        {products.removeWhere((element) => element.id == id), Get.back()});
  }

  @override
  void dispose() {
    txtName.dispose();
    txtStock.dispose();
  }
}
