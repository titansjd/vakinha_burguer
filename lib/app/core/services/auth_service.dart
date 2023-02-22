import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burguer/app/core/constants/constants.dart';

class AuthService extends GetxService {
  final _isLogged = RxnBool();
  final _getStorage = GetStorage();

  void logout() => _getStorage.write(Constants.USER_KEY, null);

  int? getUserId() => _getStorage.read(Constants.USER_KEY);

  Future<AuthService> init() async {
    _getStorage.listenKey(Constants.USER_KEY, (value) {
      if (value != null) {
        _isLogged(true);
      } else {
        _isLogged(false);
      }
    });

    ever<bool?>(_isLogged, (isLogged) {
      if (isLogged == null || !isLogged) {
        Get.offAllNamed('/auth/login');
      } else {
        Get.offAllNamed('/home');
      }
    });

    //executa na primeira execucao
    final isLoggedData = getUserId() != null;
    _isLogged(isLoggedData);

    return this;
  }
}
