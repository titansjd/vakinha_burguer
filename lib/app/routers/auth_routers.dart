import 'package:get/get.dart';

import '../modules/auth/login/login_page.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(name: '/auth/login', page: () => const LoginPage())
  ];
}
