import 'package:get/get.dart';
import 'package:git_search/screens/favorite/favorite_controller.dart';
import 'package:git_search/screens/main/main_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<FaivoriteController>(
      () => FaivoriteController(),
    );
  }
}
