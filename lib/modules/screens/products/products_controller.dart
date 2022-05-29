import 'package:auth_my_exemple/modules/screens/products/products_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/Demo_Products.dart';

class ProductsController extends GetxController {
  final products = <DemoProduct>[].obs;
  final collection = FirebaseFirestore.instance.collection('Products');

  @override
  void onInit() {
    load();
    debounce(products, (value) => print("debouce $value"),
        time: Duration(seconds: 1));
    super.onInit();
  }

  void addProduct({
    required String title,
    required String description,
    required String location,
  }) {
    collection.add({
      'title': title,
      'description': description,
      'location': location,
    });
  }

  void load() async {
    var query = await collection.get();

    final items = query.docs.map((snapshot) {
      return DemoProduct.fromSnapshot(snapshot);
    });

    products.assignAll(items);
  }

  void clear() {
    products.clear();
  }

  @override
  void onReady() {
    super.onReady();
    // loadDemoProductsFromSomeWhere();
  }

  @override
  void onClose() {
    Get.printInfo(info: 'products onClosed');
    super.onClose();
  }
}
