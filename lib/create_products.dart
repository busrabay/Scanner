import 'dart:io';

import 'package:barcode_scan/consts/users.dart';
import 'package:barcode_scan/controllers/create_product_controller.dart';
import 'package:barcode_scan/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'consts/const.dart';

class CreateProducts extends StatelessWidget {
  const CreateProducts({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateProductController(id, User("", "", "", id)));

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: Obx(
                () => Container(
                  width: Get.width / 2,
                  height: Get.height / 3.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: controller.pickedFile.value?.path != null
                      ? Image.file(
                          File(controller.pickedFile.value!.path!),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset("assets/no.png")),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 170,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: Styles.bigTitleStyle.copyWith(fontSize: 20),
                          backgroundColor: Colors.amber),
                      onPressed: controller.selectFile,
                      child: const Text(
                        "Select Image",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 50,
                    width: 170,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          textStyle: Styles.bigTitleStyle.copyWith(fontSize: 20),
                          backgroundColor: Colors.amber),
                      onPressed: () async {
                        controller.captureFromCamera();
                      },
                      child: const Text(
                        "Take a Picture",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
              child: Container(
                width: Get.width,
                height: Get.height / 2.5,
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 32)),
                    MyTextField(
                      hintText: "Product Name",
                      controller: controller.pname,
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      hintText: "Category",
                      controller: controller.category,
                    ),
                    const SizedBox(height: 40),
                    //  MyTextField(hintText: "Comment", controller: ccontroller.comment),
                    SizedBox(
                      height: 40,
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: Styles.bigTitleStyle.copyWith(fontSize: 20),
                            backgroundColor: Colors.amber),
                        onPressed: () async {
                          controller.addId();
                        },
                        child: const Text("ADD"),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
