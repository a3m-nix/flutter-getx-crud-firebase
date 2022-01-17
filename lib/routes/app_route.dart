import 'package:flutter_getx_crud/pages/home_page.dart';
import 'package:flutter_getx_crud/pages/product_create_page.dart';
import 'package:flutter_getx_crud/pages/product_page.dart';
import 'package:get/get.dart';

class AppRoute {
  static final pages = [
    GetPage(name: "/", page: () => HomePage()),
    GetPage(name: "/product", page: () => ProductPage()),
    GetPage(name: "/product/create", page: () => ProductCreatePage()),
  ];
}
