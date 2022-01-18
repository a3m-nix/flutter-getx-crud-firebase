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
                  onPressed: () => Get.find<ProductController>().add(
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
