import 'package:barcode_scan/controllers/auth_controller.dart';
import 'package:barcode_scan/services/auth_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get to => Get.find();
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void onClose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.onClose();
  }

  void createUser() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.clear);
    await AuthApi.createUser(email.text.trim(), password.text.trim());
    await Get.find<AuthController>().user.value!.updateDisplayName(name.text);
    EasyLoading.dismiss();

    name.text = "";
    password.text = "";
    email.text = "";
  }
}

class SignInController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  void signIn() async {
    EasyLoading.show(
        maskType: EasyLoadingMaskType.clear); //giriş yaparken ekrandeki dönen anlık siyah pencere
    final status = await AuthApi.signIn(
        email.text.trim(), password.text.trim()); //trim parola yada emaildeki boşlukları siler
    if (status == false) {
      Get.snackbar(
        "ALERT !!",
        "Please enter e-mail and password",
        colorText: Colors.white,
        //backgroundColor: Colors.red,
        backgroundGradient:
            LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
          Colors.red.withOpacity(0.7),
          Colors.redAccent,
        ]),
      );
    }
    EasyLoading.dismiss();
  }
}

class SignOutController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
