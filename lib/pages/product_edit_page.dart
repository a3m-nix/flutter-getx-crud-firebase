import 'package:flutter/material.dart';
import 'package:flutter_getx_crud/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductEditPage extends StatelessWidget {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    final data = productController.findById(Get.arguments);
    print(data);
    productController.txtName.text = data.name!;
    productController.txtStock.text = data.stock!;
    return Scaffold(
      appBar: AppBar(
        title: Text('EDIT Produk'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: [
              TextField(
                autocorrect: false,
                controller: productController.txtName,
                decoration: InputDecoration(
                  labelText: "Nama ",
                  hintText: "Input nama",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                autocorrect: false,
                controller: productController.txtStock,
                decoration: InputDecoration(
                  labelText: "Stock ",
                  hintText: "Input Stock",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () => Get.find<ProductController>().edit(
                      Get.arguments,
                      productController.txtName.text,
                      productController.txtStock.text),
                  child: Text('POST'))
            ],
          ),
        ),
      ),
    );
  }
}
