import 'package:flow_chat/widgets/checkbox_style.dart';
import 'package:flow_chat/widgets/logo_image.dart';
import 'package:flow_chat/widgets/text_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flow_chat/theme/app_text_style.dart';
import 'package:flow_chat/theme/app_routes.dart';
import 'package:flow_chat/utils/input_style.dart';
import 'package:flow_chat/utils/input_style_password.dart';
import 'package:flow_chat/widgets/button_styles.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerTextName = TextEditingController();
  final TextEditingController _controllerTextEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final _key = GlobalKey<FormState>();

  void goNext() {
    if (_key.currentState!.validate()) {
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.welcome, (_) => false);
    }
  }

  @override
  void dispose() {
    _controllerTextName.dispose();
    _controllerTextEmail.dispose();
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
            child: Column(
              children: [
                Form(
                  key: _key,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        LogoImage(),
                        Text(
                          'Crear cuenta',
                          style: AppTextStyle.loginTitle,
                        ),
                        const SizedBox(height: 30),
                        InputStyle(
                          text: 'Nombre',
                          controller: _controllerTextName,
                          type: TextInputType.text,
                          useIcon: CupertinoIcons.profile_circled,
                        ),
                        const SizedBox(height: 20),
                        InputStyle(
                          text: 'Correo',
                          controller: _controllerTextEmail,
                          type: TextInputType.emailAddress,
                          useIcon: CupertinoIcons.mail,
                        ),
                        const SizedBox(height: 20),
                        InputStylePassword(
                          text: 'Contraseña',
                          controller: _controllerPassword,
                        ),
                        const SizedBox(height: 15),
                        _registerCheckBox(),
                        SizedBox(height: size.height * 0.15),
                        ButtonStyles(text: 'Crear cuenta', onTap: goNext),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Ya eres miembro?'),
                            const SizedBox(width: 3),
                            TextLink(text: 'Inicia sesión', onTap: () => Navigator.pop(context))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerCheckBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CheckboxStyle(text: 'Acepto los Terminos y Condiciones', terms: true,),
      ],
    );
  }
}
