import 'package:auth_my_exemple/modules/users/user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String? phoneNumber;
  final String? avatar;

  DocumentReference<UserModel> get ref => Collections.users.doc(id);

  const UserModel(
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.avatar,
  );

  factory UserModel.fromMap(
    String id,
    Map data,
  ) {
    return UserModel(
      id,
      data['name'],
      data['email'],
      data['phoneNumber'],
      data['avatar'],
    );
  }
  factory UserModel.fromSnapshot(DocumentSnapshot<Map> snapshot) {
    Map data = snapshot.data()!;
    return UserModel(
      snapshot.id,
      data['name'],
      data['email'],
      data['phoneNumber'],
      data['avatar'],
    );
  }

  Map<String, Object?> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "avatar": avatar,
    };
  }
}
