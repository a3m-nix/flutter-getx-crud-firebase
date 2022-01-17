import 'dart:convert';

import 'package:flutter_getx_crud/models/product_model.dart';
import 'package:flutter_getx_crud/providers/product_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductController extends GetxController {
  late TextEditingController textEditingController = TextEditingController();
  var products = List<ProductModel>.empty().obs;
  bool isLoading = true;

  ProductController() {
    ProductProvider().getData().then((value) {
      Map<String, dynamic> mapData = Map<String, dynamic>.from(value);
      isLoading = false;
      for (var item in mapData.values) {
        var data =
            ProductModel(name: item['name'], createdAt: item['created_at']);
        products.add(data);
      }
      //print(mapData);
    });
    update();
  }

  void add(String name) {
    if (name != '') {
      final createdAt = DateTime.now().toIso8601String();
      final data = ProductModel(name: name, createdAt: createdAt);
      products.add(data);
      textEditingController.text = '';
      ProductProvider().postData(data).then((value) => print(value));
      Get.back();
    } else {
      dialogError("Nama tidak boleh kosong");
    }
  }

  void dialogError(String msg) {
    Get.defaultDialog(title: 'Terjadi Kesalahan', content: Text(msg));
  }

  @override
  void dispose() {
    textEditingController.dispose();
  }
}
