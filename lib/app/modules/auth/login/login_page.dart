import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vakinha_burguer/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:vakinha_burguer/app/modules/auth/login/login_controller.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/vakinha_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends VakinhaState<LoginPage, LoginController> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              //  IntrinsicHeight => pega o tamanho maximo da coluna
              child: IntrinsicHeight(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Login',
                              style: context.textTheme.headlineMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.theme.primaryColorDark)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        VakinhaTextformfield(
                          label: 'E-mail',
                          controller: _emailEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('E-mail Obrigatório'),
                            Validatorless.email('E-mail inválido')
                          ]),
                        ),
                        const SizedBox(height: 20),
                        VakinhaTextformfield(
                          label: 'Senha',
                          obscureText: true,
                          controller: _passwordEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('Senha Obrigatória'),
                            Validatorless.min(
                                6, 'Senha deve conter pelo menos 6 caracteres')
                          ]),
                        ),
                        const SizedBox(height: 50),
                        VakinhaButton(
                          label: 'ENTRAR',
                          onPressed: () {
                            final formValid =
                                _formKey.currentState?.validate() ?? false;

                            if (formValid) {
                              controller.login(
                                email: _emailEC.text.toLowerCase(),
                                password: _passwordEC.text,
                              );
                            }
                          },
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
                              child: Text('Cadastre-se',
                                  style: TextStyle(
                                      color: context.theme.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline)),
                            ),
                          ],
                        )
                      ],
                    ),
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
