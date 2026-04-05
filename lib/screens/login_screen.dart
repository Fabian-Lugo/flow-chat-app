import 'package:flow_chat/widgets/logo_image.dart';
import 'package:flow_chat/widgets/text_link.dart';
import 'package:flutter/material.dart';
import 'package:flow_chat/theme/app_text_style.dart';
import 'package:flow_chat/theme/app_routes.dart';
import 'package:flow_chat/widgets/input_style.dart';
import 'package:flow_chat/widgets/input_style_password.dart';
import 'package:flow_chat/widgets/button_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void goNext() {
    setState(() {
      if (_key.currentState!.validate()) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.inbox,
          (_) => false,
        );
      }
    });
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: _key,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  children: [
                    const _Header(),
                    SizedBox(height: 30),
                    _inputFields(
                      emailController: _controllerEmail,
                      passwordController: _controllerPassword,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextLink(
                          text: '¿Olvidaste tu contraseña?',
                          onTap: () => print('Usuario: cambiar contraseña'),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.195),
                    ButtonStyles(text: 'Iniciar sesión', onTap: goNext),
                    const SizedBox(height: 10),
                    const _registerFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LogoImage(),
        Text('¡Bienvenido nuevamente!', style: AppTextStyle.title),
        const SizedBox(height: 10),
        Text('Continuemos donde lo dejaste', style: AppTextStyle.subtitle),
      ],
    );
  }
}

class _inputFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const _inputFields({
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputStyle(
          title: 'Correo',
          labelText: 'Ingrese correo',
          controller: emailController,
          type: TextInputType.emailAddress,
          useIcon: Icons.mail_outline_outlined,
        ),
        const SizedBox(height: 13),
        InputStylePassword(
          title: 'Contraseña',
          labelText: 'Ingrese contraseña',
          controller: passwordController,
        ),
      ],
    );
  }
}

class _registerFooter extends StatelessWidget {
  const _registerFooter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No tienes cuenta?'),
            const SizedBox(width: 3),
            TextLink(
              text: 'Unete ahora',
              onTap: () => Navigator.pushNamed(context, AppRoutes.register),
            ),
          ],
        ),
      ],
    );
  }
}
