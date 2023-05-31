import 'package:barcode_scan/consts/const.dart';
import 'package:barcode_scan/controllers/sign_controller.dart';
import 'package:barcode_scan/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          "Register For An Account",
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
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 3,
                  color: Color(0xffFEA82F),
                ),
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
      const MyButton(),
    ]);
  }
}
