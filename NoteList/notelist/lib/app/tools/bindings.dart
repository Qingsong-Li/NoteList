import 'package:get/get.dart';
import 'package:notelist/app/modules/detail/controllers/detail_controller.dart';
import 'package:notelist/app/modules/home/controllers/home_controller.dart';


class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<DetailController>(
      () => DetailController(),
    );
  }
}