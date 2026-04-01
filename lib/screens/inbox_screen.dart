import 'package:flow_chat/models/user.dart';
import 'package:flow_chat/theme/app_colors.dart';
import 'package:flow_chat/theme/app_routes.dart';
import 'package:flow_chat/theme/app_text_style.dart';
import 'package:flow_chat/widgets/connection_styles.dart';
import 'package:flow_chat/widgets/online_status_badge.dart'; // Importamos el nuevo widget
import 'package:flow_chat/widgets/user_avatar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {

  final users = [
    User(uid: '1', name: 'Fabian', email: 'fabian@flow.com', online: true),
    User(uid: '2', name: 'Alonso', email: 'alonso@test.com', online: false),
    User(uid: '3', name: 'Lugo', email: 'lugo@dev.com', online: true),
    User(uid: '4', name: 'Alejandra', email: 'ale@flow.com', online: true),
  ];

  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  void goChat(User user) {
    Navigator.pushNamed(context, AppRoutes.chat, arguments: user);
  }

  void _loadUsers() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final onlineUsers = users.where((u) => u.online).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox', style: AppTextStyle.inboxAppBarTitle),
        centerTitle: true,
        backgroundColor: AppColors.surfaceLight,
        elevation: 3,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.person)),
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _loadUsers,
        header: ClassicHeader(
          completeIcon: Icon(Icons.check, color: AppColors.accent),
        ),
        child: _buildMainScrollContent(onlineUsers),
      ),
    );
  }

  ListView _buildMainScrollContent(List<User> onlineUsers) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        ConnectionStyles(state: ConnectionStateStyle.connected),
        Align(
          alignment: AlignmentGeometry.center,
          child: Text(
            'Amigos conectados',
            style: AppTextStyle.friendsConnected,
          ),
        ),
        _buildHorizontalActiveFriends(onlineUsers),
        Padding(
          padding: EdgeInsets.only(left: 15, bottom: 10),
          child: Align(
            alignment: AlignmentGeometry.centerStart,
            child: Text(
              'Bandeja de entrada',
              style: AppTextStyle.inboxSectionTitle,
            ),
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: users.length,
          itemBuilder: (_, i) => _buildChatTile(users[i]),
          separatorBuilder: (_, i) => Divider(),
        ),
      ],
    );
  }

  ListTile _buildChatTile(User user) {
    return ListTile(
      title: Text(user.name, style: AppTextStyle.nameUser),
      subtitle: Text(user.email),
      leading: UserAvatarStyle(
        user: user,
        radius: 25,
        showBadge: false,
        useAccentGradient: true,
      ),
      trailing: OnlineStatusBadge(isOnline: user.online, size: 12),
      onTap: () => goChat(user),
    );
  }

  Widget _buildHorizontalActiveFriends(List<User> onlineUsers) {
    return SizedBox(
      height: 115,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: onlineUsers.length,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Column(
              children: [
                UserAvatarStyle(user: onlineUsers[i], radius: 35, showBadge: true),
                const SizedBox(height: 5),
                SizedBox(
                  width: 70,
                  child: Text(
                    onlineUsers[i].name,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.nameUser,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}