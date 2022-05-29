// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../explorer/explore_view.dart';
// import '../register/register_view.dart';
// import 'login_view.dart';

// // final FirebaseAuth auth = FirebaseAuth.instance.
// // authStateChanges()
// // .listen(
// //   (User? user)
// //    if (user == null) {
// //       print('User is currently signed out!');
// //     } else {
// //       print('User is signed in!');
// //     });

// final FirebaseAuth auth = FirebaseAuth.instance;
// final userCollection = FirebaseFirestore.instance.collection('Users');

// class LoginController extends GetxController {
//   late Rx<User?> firebaseUser;

//   @override
//   void onInit() {
//     super.onInit();
//   }

//   @override
//   void onReady() {
//     super.onReady();

//     // firebaseUser = Rx<User?>(auth.currentUser);
//     // firebaseUser.bindStream(auth.userChanges());

//     // ever(firebaseUser, setInitialScreen);
//   }

//   // setInitialScreen(User? user) async {
//   //   if (user == null) {
//   //     Get.offAllNamed('/login');
//   //   } else {
//   //     Get.offAllNamed('/explore');
//   //   }
//   // }

//   //login user
//   void signInUser() {
//     auth.signInWithEmailAndPassword(
//       email: 'email',
//       password: 'password',
//     );
//   }

//   //Registrer User
//   // void registrer(String email, String password) async {
//   //   try {
//   //     await auth.createUserWithEmailAndPassword(
//   //         email: email, password: password);
//   //   } on FirebaseAuthException catch (e) {
//   //     Get.snackbar(
//   //       'Error',
//   //       e.message!,
//   //       snackPosition: SnackPosition.BOTTOM,
//   //       duration: const Duration(seconds: 3),
//   //     );
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }

//   // void signIn(String email, String password) async {
//   //   try {
//   //     await auth.signInWithEmailAndPassword(email: email, password: password);
//   //   } on FirebaseAuthException catch (e) {
//   //     Get.snackbar(
//   //       'Error',
//   //       e.message!,
//   //       snackPosition: SnackPosition.BOTTOM,
//   //       duration: const Duration(seconds: 3),
//   //       backgroundColor: Colors.redAccent,
//   //     );
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }

//   //sign out user
//   void signOut() async {
//     await auth.signOut();
//   }
// }
