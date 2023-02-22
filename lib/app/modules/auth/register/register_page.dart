import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burguer/app/core/ui/vakinha_state.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/vakinha_appbar.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/vakinha_button.dart';
import 'package:vakinha_burguer/app/core/ui/widgets/vakinha_textformfield.dart';
import 'package:vakinha_burguer/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState
    extends VakinhaState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(elevation: 0),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Cadastro',
                        style: context.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.theme.primaryColorDark)),
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
                  VakinhaTextformfield(
                    label: 'Nome*',
                    controller: _nameEC,
                    validator: Validatorless.required('Nome Obrigatório'),
                  ),
                  const SizedBox(height: 20),
                  VakinhaTextformfield(
                    label: 'E-mail*',
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail Obrigatório'),
                      Validatorless.email('E-mail inválido')
                    ]),
                  ),
                  const SizedBox(height: 20),
                  VakinhaTextformfield(
                    label: 'Senha*',
                    obscureText: true,
                    controller: _passwordEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha Obrigatória'),
                      Validatorless.min(
                          6, 'Senha deve conter pelo menos 6 caracteres')
                    ]),
                  ),
                  const SizedBox(height: 20),
                  VakinhaTextformfield(
                    label: 'Confirmar Senha*',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Confirma Senha Obrigatória'),
                      Validatorless.compare(
                          _passwordEC, 'Senha diferente de confirma senha'),
                    ]),
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: VakinhaButton(
                      width: double.infinity,
                      label: 'Cadastrar',
                      onPressed: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;

                        if (formValid) {
                          controller.register(
                            name: _nameEC.text,
                            email: _emailEC.text,
                            password: _passwordEC.text,
                          );
                        }
                      },
                    ),
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
