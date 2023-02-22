import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burguer/app/modules/splash/splash_controller.dart';

import '../../core/ui/widgets/vakinha_button.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.width,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: context.heightTransformer(reducedBy: 60),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  VakinhaButton(
                    label: 'Acessar',
                    heigth: 35,
                    width: context.widthTransformer(reducedBy: 40),
                    onPressed: () => controller.checkLogged(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
