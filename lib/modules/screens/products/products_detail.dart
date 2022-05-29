import 'package:auth_my_exemple/modules/screens/products/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsDetail extends StatelessWidget {
  const ProductsDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProductsController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Products Detail'),
      ),
      body: ListView(
        children: [
          Divider(),
          ListTile(
            title: Text('Title'),
          ),
          Divider(),
          ListTile(
            title: Text('Details'),
          ),
          Divider(),
          ListTile(
            title: Text('Images'),
          ),
          Divider(),
        ],
      ),
    );
  }
}
