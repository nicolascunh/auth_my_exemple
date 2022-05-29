import 'dart:async';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'user.dart';

class Collections {
  static final CollectionReference<UserModel> users = FirebaseFirestore //
      .instance
      .collection("users")
      .withConverter(
        fromFirestore: (snapshot, options) => UserModel.fromSnapshot(snapshot),
        toFirestore: (model, options) => model.toMap(),
      );
}

class UserController {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static UserController get to => Get.find<UserController>();

  Rx<User?> $account = Rx(null);

  Rx<UserModel?> $user = Rx(null);

  bool get isLoggedIn => auth.currentUser != null;

  UserModel? get user => $user.value;

  User? get account => $account.value;

  StreamSubscription? _subscription;

  UserController();

  initialize() async {
    Completer completer = Completer();
    auth.authStateChanges().listen((account) {
      _subscription?.cancel();
      $account.value = account;

      if (account != null) {
        _subscription =
            Collections.users.doc(account.uid).snapshots().listen((user) {
          $user.value = user.data();
          account.updateDisplayName($user.value!.name);
          if ($user.value?.email != null) {
            account.updateEmail("${$user.value?.email}");
          }
          if ($user.value?.avatar != null) {
            account.updatePhotoURL($user.value!.avatar);
          }
          if (!completer.isCompleted) completer.complete();
        });
      } else {
        $user.value = null;
        if (!completer.isCompleted) completer.complete();
      }
    });

    return completer.future.then((value) => Get.put(this, permanent: true));
  }

  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    return await auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<void> userCreate(User user) async {
    UserModel model = UserModel(
      user.uid,
      user.displayName!,
      user.email!,
      user.phoneNumber,
      user.photoURL,
    );

    await Collections.users.doc(user.uid).set(model);
  }

  Future<void> update(Map<String, Object?> data) {
    if (user != null) return user!.ref.update(data);
    throw Exception("User is not logged in");
  }
}
