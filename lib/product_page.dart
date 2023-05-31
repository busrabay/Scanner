import 'package:barcode_scan/consts/const.dart';
import 'package:barcode_scan/consts/users.dart';
import 'package:barcode_scan/controllers/auth_controller.dart';
import 'package:barcode_scan/controllers/comment_controller.dart';
import 'package:barcode_scan/controllers/product_controller.dart';
import 'package:barcode_scan/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    final controllerProduct = Get.put(ProductController(id));
    final controllerAuth = Get.find<AuthController>().user.value;

    final controller = Get.put(CommentController(
        id,
        User("", "", controllerAuth?.displayName?.toString() ?? "",
            controllerAuth?.uid.toString() ?? "")));
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Text(
            "Products",
            style: Styles.bigTitleStyle.copyWith(fontSize: 25),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.only(top: 8, left: 5, right: 5),
                child: Obx(
                  () => Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    height: Get.height / 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16), color: const Color(0xffFEA82F)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.red, borderRadius: BorderRadius.circular(50)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                controllerProduct.product.value?.image ?? "",
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Product: " " " "${controllerProduct.product.value?.pname}",
                                style: Styles.bigTitleStyle.copyWith(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: Text(
                                  "Category: " " " "${controllerProduct.product.value?.category}",
                                  style: Styles.bigTitleStyle.copyWith(fontSize: 18),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Barcode Id: "
                                " "
                                "${controllerProduct.product.value?.barcodeId}",
                                style: Styles.bigTitleStyle.copyWith(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: const Color(0xffFEA82F)),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32)),
                    child: const Icon(
                      Icons.comment,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
                  child: SizedBox(
                    height: 50,
                    width: Get.width - 100,
                    child: TextField(
                      maxLines: 1,
                      controller: controller.comment,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 3, color: Color(0xffFEA82F)),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        hintText: "Write Comment",
                        hintStyle: Styles.bigTitleStyle
                            .copyWith(fontSize: 15, color: const Color(0xFFD8D4D4)),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.addCommment();
                            controller.getProductWithComment();
                          },
                          icon: const Icon(Icons.send_rounded),
                          color: Colors.white,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xffFEA82F),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Obx(
              () => ListView(
                  shrinkWrap: true,
                  children: controller.productWithComment.value == null
                      ? []
                      : controller.productWithComment.value!
                          .map(
                            (e) => CommentContainer(commentt: e),
                          )
                          .toList()),
            )
          ]),
        ),
      ),
    );
  }
}
