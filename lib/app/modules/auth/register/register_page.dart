import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/ui/vakinha_ui.dart';
import '../../../core/ui/widgets/vakinha_appbar.dart';
import '../../../core/ui/widgets/vakinha_button.dart';
import '../../../core/ui/widgets/vakinha_textformfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Form(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Cadastro',
                        style: context.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.primaryColor)),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Preencha os campos abaixo para criar o seu cadastro',
                      style: context.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.theme.primaryColor),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const VakinhaTextformfield(label: 'Nome*'),
                  const SizedBox(height: 20),
                  const VakinhaTextformfield(label: 'E-mail*'),
                  const SizedBox(height: 20),
                  const VakinhaTextformfield(
                    label: 'Senha*',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  const VakinhaTextformfield(
                    label: 'Confirmar Senha*',
                    obscureText: true,
                  ),
                  const SizedBox(height: 50),
                  Spacer(),
                  VakinhaButton(
                    label: 'CADASTRAR',
                    onPressed: () {},
                    width: context.widthTransformer(reducedBy: 10),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
