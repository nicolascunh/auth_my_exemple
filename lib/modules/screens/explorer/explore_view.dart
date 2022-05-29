import 'package:auth_my_exemple/components/separator.dart';
import 'package:auth_my_exemple/modules/users/user_controller.dart';
import 'package:auth_my_exemple/modules/screens/products/products_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../partners/partners_view.dart';

class ExploreView extends GetView<UserController> {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      body: ListView(
        children: [
          Obx(() {
            return ListTile(
              title: Text('${controller.user?.name}'),
              subtitle: Text('${controller.user?.email}'),
            );
          }),
          ListTile(
            leading: Icon(Icons.people_outlined),
            trailing: Icon(Icons.chevron_right),
            title: Text('Partners'),
            onTap: () {
              Get.to(() => PartnersView());
            },
          ),
          Separator.spacer,
          ListTile(
            leading: Icon(Icons.production_quantity_limits_outlined),
            trailing: Icon(Icons.chevron_right),
            title: Text('Products'),
            onTap: () {
              Get.to(() => ProductsList());
            },
          ),
          Separator.spacer,
          ListTile(
            leading: Icon(Icons.exit_to_app),
            trailing: Icon(Icons.chevron_right),
            title: Text('Sign out'),
            onTap: () async {
              Get.offAllNamed('/');
              await UserController.to.signOut();
            },
          ),
        ],
      ),
    );
  }
}
