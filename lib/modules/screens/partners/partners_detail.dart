import 'package:auth_my_exemple/components/separator.dart';
import 'package:flutter/material.dart';

class PartnerDetail extends StatelessWidget {
  const PartnerDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Partner Detail'),
      ),
      body: ListView(children: [
        Divider(),
        ListTile(
          title: Text('Name'),
          trailing: Text('Partner'),
        ),
        Divider(),
        ListTile(
          title: Text('E-mail'),
          trailing: Text('partner@gmail.com'),
        ),
        Divider(),
        ListTile(
          title: Text('Messages'),
          trailing: Text('Lorem ipsum dolor sit amet'),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
              ),
            ],
          ),
        )
      ]),
    );
  }
}
