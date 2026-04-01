import 'package:flow_chat/models/user.dart';
import 'package:flow_chat/theme/app_colors.dart';
import 'package:flow_chat/theme/app_text_style.dart';
import 'package:flow_chat/widgets/online_status_badge.dart'; // Importamos el nuevo widget
import 'package:flutter/material.dart';

class UserAvatarStyle extends StatelessWidget {
  final User user;
  final double radius;
  final bool showBadge;
  final bool useAccentGradient;

  const UserAvatarStyle({
    super.key,
    required this.user,
    required this.radius,
    required this.showBadge,
    this.useAccentGradient = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: useAccentGradient
                  ? [
                      AppColors.accentLight,
                      AppColors.accentDark.withOpacity(0.6),
                    ]
                  : [AppColors.text, AppColors.text.withOpacity(0.6)],
            ),
          ),
          child: CircleAvatar(
            radius: radius,
            backgroundColor: Colors.transparent,
            child: Text(
              user.name.substring(0, 2),
              style: AppTextStyle.avatarInitials,
            ),
          ),
        ),
        if (showBadge)
        Positioned(
          right: 1,
          bottom: 1,
          child: OnlineStatusBadge(
            isOnline: user.online, 
            size: 20
          ),
        ),
      ],
    );
  }
}