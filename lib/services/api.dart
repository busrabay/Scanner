import 'package:barcode_scan/consts/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Api {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<bool> productAdd(Products product) async {
    try {
      await _firestore.collection("products").doc(product.barcodeId).set(product.toMap());
      return true;
    } catch (_) {
      return false;
    }
  }

  // static Future<User> userAdd(User user) async {
  //   try {
  //     await _firestore.collection("users").doc(user.id).set(user.toMap());
  //   } catch (_) {}
  //   return user;
  //}

  static Future<Commentt?> commentAdd(String barcodeID, Commentt comment) async {
    try {
      _firestore.collection("comments").doc(barcodeID).set({
        "comments": FieldValue.arrayUnion([comment.toMap()]),
      }, SetOptions(merge: true));
    } catch (_) {}
    return null;
  }

  // static Future<Commentt?> commentAdd(Products product, String comment) async {
  //   try {
  //     _firestore.collection("products").doc(product.barcodeId).update({"comment": comment});
  //   } catch (_) {}
  //   return null;
  // }

  static Future<Products?> getProduct(String id) async {
    try {
      final product = await _firestore.collection("products").doc(id).get();
      if (product.data() == null) {
        return null;
      }
      return Products.fromMap(product.data()!);
    } catch (_) {
      return null;
    }
  }

  static Future<List<Commentt>> getCommentsOfProduct(String pid) async {
    try {
      final comment = await _firestore.collection("comments").doc(pid).get();
      final list = comment.data()?["comments"] as List<dynamic>?;
      return list!.map((e) => Commentt.fromMap(e)).toList();
    } catch (_) {
      print(_);
      return [];
    }
  }

  static Future<bool?> isExists(String id) async {
    try {
      final product = await _firestore.collection("products").doc(id).get();
      if (product.exists) {
        return true;
      }
      return false;
    } catch (_) {
      return null;
    }
  }
}
