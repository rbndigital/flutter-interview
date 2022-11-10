import 'package:flutter/material.dart';
import 'package:platform_design/news_tab.dart';
import 'package:platform_design/profile_tab.dart';
import 'package:platform_design/settings_tab.dart';
import 'package:platform_design/songs_tab.dart';

class AndroidDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.green),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Icon(
                Icons.account_circle,
                color: Colors.green.shade800,
                size: 96,
              ),
            ),
          ),
          ListTile(
            leading: SongsTab.androidIcon,
            title: const Text(SongsTab.title),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: NewsTab.androidIcon,
            title: const Text(NewsTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => const NewsTab()));
            },
          ),
          ListTile(
            leading: ProfileTab.androidIcon,
            title: const Text(ProfileTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => const ProfileTab()));
            },
          ),
          ListTile(
            leading: SettingsTab.androidIcon,
            title: const Text(SettingsTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => const SettingsTab()));
            },
          ),
        ],
      ),
    );
  }
}
