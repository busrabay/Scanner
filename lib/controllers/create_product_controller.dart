import 'dart:io';

import 'package:barcode_scan/consts/users.dart';
import 'package:barcode_scan/controllers/auth_controller.dart';
import 'package:barcode_scan/controllers/helpers.dart';
import 'package:barcode_scan/product_page.dart';
import 'package:barcode_scan/services/api.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateProductController extends GetxController {
  static CreateProductController get to => Get.find();

  final FirebaseStorage _storage = FirebaseStorage.instance;

  final pname = TextEditingController();
  final category = TextEditingController();

  final pickedFile = Rxn<PlatformFile>();
  final String productId;
  final User? user;
  final picker = ImagePicker();

  CreateProductController(this.productId, this.user);

  void addId() async {
    final res = await uploadPic();
    if (res == null) return;

    final productModel = Products(
      barcodeId: productId.isEmpty ? Helpers.generateNonce() : productId,
      uid: user?.id.toString(),
      pname: pname.text.trim(),
      category: category.text.trim(),
      image: res,
      // uname: user?.name.toString(), // AuthController.to.user.value!.displayName,
    );

    final result = await Api.productAdd(productModel);
    if (result) {
      Get.to(
        ProductPage(
          id: productModel.barcodeId,
        ),
      );
      //Eklendi;
    }
    category.text = "";
    pname.text = "";
  }

  @override
  void onClose() {
    pname.dispose();
    category.dispose();
    super.onClose();
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      pickedFile.value = result.files.first;
    }
  }

  Future captureFromCamera() async {
    final result = await ImagePicker().pickImage(source: ImageSource.camera);
    if (result != null) {
      final bytes = await result.readAsBytes();
      pickedFile.value =
          PlatformFile(name: result.name, size: bytes.length, bytes: bytes, path: result.path);
    }
  }

  Future<String?> uploadPic() async {
    try {
      final uid = AuthController.to.user.value!.uid;
      Reference reference = _storage.ref().child(uid);

      final file = File(pickedFile.value!.path!);
      final data = await reference.putFile(file);
      final url = await data.ref.getDownloadURL();
      return url;
    } catch (_) {
      return null;
    }
    //returns the download url
  }
}
