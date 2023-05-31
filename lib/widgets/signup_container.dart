// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barcode_scan/consts/const.dart';
import 'package:barcode_scan/controllers/sign_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MySignContainer extends StatelessWidget {
  const MySignContainer({Key? key, this.hintText, this.email, this.password, this.controller})
      : super(key: key);
  final String? hintText;
  final String? email;
  final String? password;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpController>();
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Lottie.asset("assets/lotties/new.json", width: 250, height: 250),
      Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Text(
          "Sign Up",
          style: Styles.bigTitleStyle,
          textAlign: TextAlign.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50, // MediaQuery.of(context).size.height,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.transparent),
          child: TextField(
            controller: controller.email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Color(0xffFEA82F)),
                borderRadius: BorderRadius.circular(16),
              ),
              hintText: "E-mail",
              hintStyle: const TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffFEA82F),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.transparent),
          child: TextField(
            controller: controller.password,
            obscureText: true,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Color(0xffFEA82F)),
                borderRadius: BorderRadius.circular(16),
              ),
              hintText: "Password",
              hintStyle: const TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffFEA82F),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.transparent),
          child: TextField(
            controller: controller.name,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Color(0xffFEA82F)),
                borderRadius: BorderRadius.circular(16),
              ),
              hintText: "Name",
              hintStyle: const TextStyle(color: Colors.white),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffFEA82F),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: GestureDetector(
          onTap: () {
            controller.createUser();
            Get.back();
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
    ]);
    //   padding: const EdgeInsets.symmetric(horizontal: 16),

    //   child: Container(
    //     width: Get.width,
    //     height: 50,
    //     decoration:
    //         BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.transparent),
    //     child: TextField(
    //       controller: controller,
    //       decoration: InputDecoration(
    //         enabledBorder: OutlineInputBorder(
    //           borderSide: const BorderSide(width: 3, color: Color(0xFFFF8400)),
    //           borderRadius: BorderRadius.circular(16),
    //         ),
    //         hintText: hintText,
    //         focusedBorder: OutlineInputBorder(
    //           borderSide: const BorderSide(
    //             color: Color(0xFFFF8400),
    //             width: 3,
    //           ),
    //           borderRadius: BorderRadius.circular(16),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
