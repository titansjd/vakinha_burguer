import 'package:get/get.dart';
import 'package:vakinha_burguer/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burguer/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burguer/app/repositories/auth/auth_repository/auth_repository.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  @override
  void onInit() {
    loaderListener(loading);
    messageListener(message);
    super.onInit();
  }

  RegisterController({required AuthRepository authRepository})
      : _authRepository = authRepository;
}
