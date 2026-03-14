import 'package:flow_chat/theme/app_routes.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(App());
 
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flow-chat',
      initialRoute: AppRoutes.login,
      routes: appRoutes,
    );
  }
}