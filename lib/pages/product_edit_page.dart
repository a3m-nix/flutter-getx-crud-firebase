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
    productController.textEditingController.text = data.name!;
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
                controller: productController.textEditingController,
                decoration: InputDecoration(
                  labelText: "Nama ",
                  hintText: "Input nama",
                  border: OutlineInputBorder(),
                ),
                onEditingComplete: () => Get.find<ProductController>().edit(
                    Get.arguments,
                    productController.textEditingController.text),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () => Get.find<ProductController>().edit(
                      Get.arguments,
                      productController.textEditingController.text),
                  child: Text('POST'))
            ],
          ),
        ),
      ),
    );
  }
}
