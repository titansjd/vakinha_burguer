import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burguer/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burguer/app/routers/splash_routers.dart';

import 'app/core/bindings/application_bindings.dart';
import 'app/routers/auth_routers.dart';
import 'app/routers/home_routers.dart';
import 'app/routers/register_routers.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const VakinhaBurguerMainApp());
}

class VakinhaBurguerMainApp extends StatelessWidget {
  const VakinhaBurguerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vakinha Burguer',
      theme: VakinhaUi.theme,
      initialBinding: ApplicationBindings(),
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
        ...RegisterRouters.routers,
        ...HomeRouters.routers,
      ],
    );
  }
}
