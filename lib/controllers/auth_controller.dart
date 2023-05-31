import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  final user = Rxn<User>();

  static final _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    // ever(user, (newUser) {});
    user.bindStream(_auth.userChanges());

    super.onInit();
  }
}
