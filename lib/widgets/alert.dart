import 'package:barcode_scan/create_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../consts/const.dart';

class NullAlertDialog extends StatelessWidget {
  const NullAlertDialog({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: CupertinoAlertDialog(
        insetAnimationDuration: const Duration(milliseconds: 10),
        title: Text(
          "Not found",
          style: Styles.bigTitleStyle.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        content: Text(
          "The product you are looking for was not found",
          style: Styles.bigTitleStyle.copyWith(fontSize: 17, color: Colors.black),
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: Get.back,
            child: Text(
              "Cancel",
              style: Styles.bigTitleStyle.copyWith(fontSize: 18, color: Colors.red),
            ),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Get.to(CreateProducts(id: id)),
            child: Text(
              "Add Product",
              style: Styles.bigTitleStyle.copyWith(fontSize: 18, color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}
