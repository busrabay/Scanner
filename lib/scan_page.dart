import 'package:barcode_scan/consts/const.dart';
import 'package:flutter/material.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Expanded(
        child: Container(
          width: 120,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: const Color(0xffEA8A3B),
          ),
          child: Text(
            "Sign up",
            style: Styles.bigTitleStyle.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
