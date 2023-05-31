import 'package:barcode_scan/consts/users.dart';
import 'package:barcode_scan/services/api.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  String id;
  ProductController(this.id);

  final product = Rxn<Products>();
  final isLoading = true.obs;

  @override
  void onInit() async {
    get();
    isLoading.value = false;
    super.onInit();
  }

  Future<void> get() async {
    final result = await Api.getProduct(id);
    print(result);
    product.value = result;
  }
}
