import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:vakinha_burguer/app/core/services/auth_service.dart';

class SplashController extends GetxController {
  void checkLogged() {
    Get.putAsync(() => AuthService().init());
  }
}
