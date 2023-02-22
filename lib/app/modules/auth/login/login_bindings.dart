import 'package:get/get.dart';

import '../../../repositories/auth/auth_repository/auth_repository.dart';
import '../../../repositories/auth/auth_repository/auth_repository_impl.dart';
import 'login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        restClient: Get.find(),
      ),
    );

    Get.lazyPut(
      () => LoginController(authRepository: Get.find()),
    );
  }
}
