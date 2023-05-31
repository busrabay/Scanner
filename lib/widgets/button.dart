import 'package:barcode_scan/consts/const.dart';
import 'package:barcode_scan/controllers/sign_controller.dart';
import 'package:barcode_scan/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends GetView<SignInController> {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: controller.signIn,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Container(
              width: Get.width / 3,
              height: Get.height / 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xffFEA82F),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Sign In",
                  style: Styles.bigTitleStyle.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            const Expanded(
              child: Divider(
                thickness: 1,
                height: 0,
                color: Colors.white,
                indent: 32,
                endIndent: 5,
              ),
            ),
            Text(
              "OR",
              style: Styles.bigTitleStyle.copyWith(fontSize: 15),
            ),
            const Expanded(
              child: Divider(
                height: 0,
                thickness: 1,
                color: Colors.white,
                endIndent: 32,
                indent: 5,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MySignUpPage()),
              );
            },
            child: Container(
              width: Get.width / 3,
              height: Get.height / 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xffFEA82F),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "Sign Up",
                  style: Styles.bigTitleStyle.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
