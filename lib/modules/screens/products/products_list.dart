import 'package:auth_my_exemple/components/action_button.dart';
import 'package:auth_my_exemple/modules/screens/products/products_controller.dart';
import 'package:auth_my_exemple/modules/screens/products/products_detail.dart';
import 'package:auth_my_exemple/modules/screens/products/products_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsList extends GetView<ProductsController> {
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductsController());
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Colors.black,
        padding: EdgeInsetsDirectional.all(8),
        trailing: Icon(
          CupertinoIcons.search,
        ),
        middle: const Text(
          'Products',
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            actions: [
              ActionButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              ActionButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            label: const Icon(Icons.add),
            onPressed: () async {
              await Get.to(
                () => ProductsForm(),
                fullscreenDialog: true,
                transition: Transition.fade,
              );
              // controller.load();
            },
          ),
          body: Obx(
            () => RefreshIndicator(
              onRefresh: () async {
                controller.load();
              },
              child: ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  final item = controller.products[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        Get.to(() => const ProductsDetail());
                      },
                      title: Text(item.title),
                      subtitle: Text(item.description),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
