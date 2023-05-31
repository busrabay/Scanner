// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:barcode_scan/consts/const.dart';
import 'package:barcode_scan/consts/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentContainer extends StatelessWidget {
  const CommentContainer({
    super.key,
    required this.commentt,
  });
  final Commentt commentt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        width: Get.width,
        height: Get.height / 10,
        decoration: BoxDecoration(
            // border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(32),
            color: Colors.transparent),
        child: ListTile(
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: Colors.grey),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                "assets/kullanıcı.jpg",
                width: Get.width,
                height: Get.height,
              ),
            ),
          ),
          title: Text(
            commentt.name.toString(),
            style: Styles.bigTitleStyle.copyWith(fontSize: 20),
          ),
          subtitle: Text(
            commentt.comment.toString(),
            style: Styles.bigTitleStyle.copyWith(fontSize: 15),
          ),
          trailing: Text(
            commentt.createdAt.toString(),
            style: Styles.bigTitleStyle.copyWith(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
