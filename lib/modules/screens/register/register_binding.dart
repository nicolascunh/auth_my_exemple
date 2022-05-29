import 'package:auth_my_exemple/modules/screens/register/register_controller.dart';
import 'package:get/instance_manager.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
  }
}
