import 'package:auth_my_exemple/modules/screens/products/products_controller.dart';
import 'package:get/instance_manager.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsController>(
      () => ProductsController(),
    );
  }
}
