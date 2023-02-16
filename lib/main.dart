import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burguer/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burguer/app/routers/splash_routers.dart';

void main() {
  runApp(const VakinhaBurguerMainApp());
}

class VakinhaBurguerMainApp extends StatelessWidget {
  const VakinhaBurguerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vakinha Burguer',
      theme: VakinhaUi.theme,
      getPages: [
        ...SplashRouters.routers,
      ],
    );
  }
}
