// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// import 'user.dart';

// class UserController extends GetxController {
//   final userCollection = FirebaseFirestore.instance.collection('Users');
//   final users = <UserModel>[].obs;
//   @override
//   void onInit() {
//     load();
//     super.onInit();
//   }

//   void createUser({
//     required String name,
//     required String email,
//     required String password,
//   }) {
//     userCollection.add({
//       'name': name,
//       'email': email,
//       'password': password,
//     });
//   }

//   void signInUser({
//     required String email,
//     required String password,
//   }) {
//     userCollection.add({
//       'email': email,
//       'password': password,
//     });
//   }

//   void load() async {
//     var query = await userCollection.get();

//     final user = query.docs.map((snapshot) {
//       return UserModel.fromSnapshot(snapshot);
//     });

//     users.assignAll(user);
//   }

//   void clear() {
//     users.clear();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//     // loadDemoProductsFromSomeWhere();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//   }
// }
