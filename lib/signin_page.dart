import 'dart:ui';

import 'package:barcode_scan/widgets/login_container.dart';
import 'package:flutter/material.dart';

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  margin: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
                  height: MediaQuery.of(context).size.height / 1.6,
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
                        child: const LoginWidget(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
