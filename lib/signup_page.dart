import 'dart:ui';

import 'package:barcode_scan/controllers/sign_controller.dart';
import 'package:barcode_scan/widgets/signup_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySignUpPage extends StatelessWidget {
  const MySignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned.fill(child: Image.asset("assets/image.jpg")),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 20),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 750),
                        padding: const EdgeInsets.all(22),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.white.withOpacity(0.5),
                                  Colors.orangeAccent,
                                ]),
                            color: Colors.white10.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                        child: const MySignContainer(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
      // backgroundColor: Colors.black,
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      //     child: SafeArea(
      //       child: Column(
      //         children: [
      //           Text(
      //             "Lets Sign Up",
      //             style:
      //                 Styles.bigTitleStyle.copyWith(fontSize: 25, color: const Color(0xFFFF8400)),
      //           ),
      //           Lottie.asset(
      //             "assets/lotties/new.json",
      //             width: 250,
      //             height: 300,
      //           ),
      //           Text("Name-Surname", style: Styles.bigTitleStyle.copyWith(fontSize: 20)),
      //           const SizedBox(
      //             height: 8,
      //           ),
      //           MySignContainer(
      //             controller: controller.name,
      //             hintText: "Name",
      //           ),
      //           const SizedBox(
      //             height: 8,
      //           ),
      //           Text(
      //             "E-Mail",
      //             style: Styles.bigTitleStyle.copyWith(fontSize: 20),
      //           ),
      //           const SizedBox(
      //             height: 8,
      //           ),
      //           MySignContainer(
      //             controller: controller.email,
      //             hintText: "E-Mail",
      //           ),
      //           const SizedBox(
      //             height: 8,
      //           ),
      //           Text("Password", style: Styles.bigTitleStyle.copyWith(fontSize: 20)),
      //           const SizedBox(
      //             height: 8,
      //           ),
      //           MySignContainer(
      //             controller: controller.password,
      //             hintText: "Password",
      //           ),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           GestureDetector(
      //             onTap: controller.createUser,
      //             child: Container(
      //               width: Get.width / 3,
      //               height: Get.height / 15,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(16),
      //                 color: const Color(0xFFFF8400),
      //               ),
      //               child: Padding(
      //                 padding: const EdgeInsets.symmetric(vertical: 8),
      //                 child: Text(
      //                   "Sign Up",
      //                   style: Styles.bigTitleStyle.copyWith(fontSize: 20),
      //                   textAlign: TextAlign.center,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
