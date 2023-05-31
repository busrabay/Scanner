import 'package:barcode_scan/barcode_page.dart';
import 'package:barcode_scan/controllers/auth_controller.dart';
import 'package:barcode_scan/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootWrapper extends GetView<AuthController> {
  const RootWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.user.value == null ? const MyLoginPage() : const BarcodeScanPage(),
    );
  }
}
