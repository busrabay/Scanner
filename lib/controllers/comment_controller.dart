import 'package:barcode_scan/consts/users.dart';
import 'package:barcode_scan/controllers/product_controller.dart';
import 'package:barcode_scan/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class CommentController extends GetxController {
  CommentController(this.productId, this.user);
  static CommentController get to => Get.find();

  final comment = TextEditingController();

  final isLoading = true.obs;
  final String productId;
  final productWithComment = Rxn<List<Commentt>?>();
  final User user;
  // String formattedDate=DateFormat.Hm().format(DateTime.now());

  @override
  void onInit() async {
    print("buraya girdi");
    getProductWithComment();
    isLoading.value = false;
    super.onInit();
  }

  void addCommment() async {
    final commentModel = Commentt(
        comment: comment.text,
        uid: user.id,
        name: AuthController.to.user.value?.displayName,
        createdAt: DateTime.now());
    final result = await Api.commentAdd(Get.find<ProductController>().id, commentModel);
    comment.text = "";
  }

  void getProductWithComment() async {
    final result = await Api.getCommentsOfProduct(productId);
    print(result);
    productWithComment.value = result;
    print(productWithComment.value);
  }

  @override
  void onClose() {
    comment.dispose();
    super.onClose();
  }
}
