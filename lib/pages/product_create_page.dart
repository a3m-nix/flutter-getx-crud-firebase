import 'package:flutter/material.dart';
import 'package:flutter_getx_crud/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductCreatePage extends StatelessWidget {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Produk'),
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
                onEditingComplete: () => Get.find<ProductController>()
                    .add(productController.textEditingController.text),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () => Get.find<ProductController>()
                      .add(productController.textEditingController.text),
                  child: Text('POST'))
            ],
          ),
        ),
      ),
    );
  }
}
