import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  static ImageController get to => Get.find();
  final image = "";

  final pickedFile = Rxn<PlatformFile>();

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      pickedFile.value = result.files.first;
    }
  }
}
