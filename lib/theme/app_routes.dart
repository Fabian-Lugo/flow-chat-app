import 'package:flutter/material.dart';
import 'package:flow_chat/screens/login_screen.dart';

/// Nombres de rutas para evitar strings mágicos.
abstract class AppRoutes {
  AppRoutes._();
  static const String login = 'login';
  //static const String register = 'register';
  //static const String chat = 'chat';
  //static const String users = 'users';
}

final Map<String, Widget Function(BuildContext)> appRoutes = {
  AppRoutes.login: (_) => const LoginScreen(),
  //AppRoutes.register: (_) => const RegisterScreen(),
  //AppRoutes.chat: (_) => const RegisterScreen(),
  //AppRoutes.users: (_) => const RegisterScreen(),
};