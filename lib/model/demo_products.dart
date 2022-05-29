// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';

class DemoProduct {
  final String title;
  final String description;
  final String? localization;

  DemoProduct({
    required this.title,
    required this.description,
    this.localization,
  });

  factory DemoProduct.fromMap(Map data) {
    return DemoProduct(
      title: data['title'],
      description: data['description'],
      localization: data['localization'],
    );
  }

  factory DemoProduct.fromSnapshot(DocumentSnapshot<Map> snapshot) {
    snapshot.id;
    Map data = snapshot.data()!;
    return DemoProduct(
      title: data['title'],
      description: data['description'],
      localization: data['localization'],
    );
  }
}
