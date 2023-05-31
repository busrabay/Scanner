import 'package:barcode_scan/consts/const.dart';
import 'package:barcode_scan/controllers/sign_controller.dart';
import 'package:barcode_scan/product_page.dart';
import 'package:barcode_scan/services/api.dart';
import 'package:barcode_scan/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class BarcodeScanPage extends StatelessWidget {
  const BarcodeScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignOutController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 8,
                left: 250,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: controller.signOut,
                    icon: const Icon(Icons.logout_rounded),
                    color: Colors.white,
                    iconSize: 40,
                  ),
                  Text(
                    "Sign Out",
                    style: Styles.bigTitleStyle.copyWith(fontSize: 20),
                  ),
                ],
              ),
            ),
            Expanded(child: Lottie.asset("assets/lotties/qrr.json")),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  scanBarcode(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFEA82F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                child: Text(
                  "Start Scan",
                  style: Styles.bigTitleStyle.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void scanBarcode(context) async {
    final id = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancel", true, ScanMode.BARCODE);
    final status = await Api.isExists(id);

    if (status == null) return;

    if (status) {
      Get.to(ProductPage(id: id));
    } else {
      Get.dialog(NullAlertDialog(id: id));
    }
  }
}
