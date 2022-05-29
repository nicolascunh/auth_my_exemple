import 'package:auth_my_exemple/modules/screens/partners/partners_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class PartnersView extends StatelessWidget {
  const PartnersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Partners'),
      ),
      body: ListView.builder(
        itemCount: 11,
        itemBuilder: ((context, index) {
          return ListTile(
            onTap: () {
              Get.to(() => PartnerDetail());
            },
            leading: CircleAvatar(
              backgroundColor: Colors.grey[850],
            ),
            title: Text('Partner #$index'),
            trailing: Icon(Icons.chevron_right),
          );
        }),
      ),
    );
  }
}
