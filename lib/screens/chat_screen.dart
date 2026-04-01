import 'package:flow_chat/models/user.dart'; // Import para reconocer la clase User
import 'package:flow_chat/theme/app_colors.dart';
import 'package:flow_chat/theme/app_text_style.dart';
import 'package:flow_chat/widgets/user_avatar_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatelessWidget {
  final String? userName;
  const ChatScreen({
    this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)?.settings.arguments as User?;    
    final String name = user?.name ?? userName ?? 'Usuario';

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            if (user != null) 
            UserAvatarStyle(user: user, radius: 20, showBadge: false, useAccentGradient: true  ,),
            const SizedBox(height: 4), // Espacio entre avatar y nombre
            Text(name, style: GoogleFonts.inter(fontSize: 15, fontWeight: .w500, color: AppColors.text),),
          ],
        ), 
        centerTitle: true,
        elevation: 1,
      ),
      body: const Center(
        child: Text('Chat Screen'),
      ),
    );
  }
}
