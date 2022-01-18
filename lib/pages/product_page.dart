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
          () => (controller.isLoading == true)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : controller.products.isEmpty
                  ? Center(child: Text('Data masih kosong'))
                  : ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = controller.products[index];
                        return ListTile(
                          leading: CircleAvatar(),
                          title: Text(item.name ?? ''),
                          subtitle: Text("Stok " + item.stock.toString()),
                          trailing: InkWell(
                            child: Icon(Icons.delete),
                            onTap: () => Get.defaultDialog(
                                textConfirm: "Confirm",
                                textCancel: "Cancel",
                                onConfirm: () =>
                                    controller.delete(item.id.toString()),
                                middleText: "Anda Yakin ?"),
                          ),
                          onTap: () =>
                              Get.toNamed("/product/edit", arguments: item.id),
                        );
                      },
                    ),
        ));
  }
}
