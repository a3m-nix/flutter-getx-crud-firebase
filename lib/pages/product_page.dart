import 'package:flutter/material.dart';
import 'package:flutter_getx_crud/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  var controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Produk'),
          actions: [
            IconButton(
                onPressed: () => Get.toNamed("/product/create"),
                icon: Icon(Icons.add))
          ],
        ),
        body: Obx(
          () => controller.products.isEmpty
              ? Center(child: Text('Data masih kosong'))
              : ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = controller.products[index];
                    return ListTile(
                      leading: CircleAvatar(),
                      title: Text(item.name ?? ''),
                      trailing: Icon(Icons.delete),
                    );
                  },
                ),
        ));
  }
}
