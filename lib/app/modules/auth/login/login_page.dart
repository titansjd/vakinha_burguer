import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burguer/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/vakinha_textformfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            //  IntrinsicHeight => pega o tamanho maximo da coluna
            child: IntrinsicHeight(
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('Login',
                            style: context.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.theme.primaryColor)),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const VakinhaTextformfield(label: 'E-mail'),
                      const SizedBox(height: 20),
                      const VakinhaTextformfield(
                        label: 'Senha',
                        obscureText: true,
                      ),
                      const SizedBox(height: 50),
                      VakinhaButton(
                        label: 'ENTRAR',
                        onPressed: () {},
                        width: context.widthTransformer(reducedBy: 10),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Não possui conta?'),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/auth/register');
                            },
                            child: const Text(
                              'Cadastre-se',
                              style: VakinhaUi.textBold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
