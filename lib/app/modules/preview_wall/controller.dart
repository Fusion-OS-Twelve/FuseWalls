import 'package:get/get.dart';

class PreviewWallController extends GetxController {
  var path = "".obs;
  @override
  void onInit() {
    var args = Get.arguments;
    path.value = args["path"];
    super.onInit();
  }

  @override
  void onClose() {
    path.value = "";
    super.onClose();
  }
}
