import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ytquran/core/utils/constant.dart';
import 'package:ytquran/settings.dart';

class DrawerItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildListTile(
          icon: Icons.settings,
          title: 'Settings',
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Settings()));
          },
        ),
        _buildListTile(
          icon: Icons.share,
          title: 'Share',
          onTap: () {
            Share.share(
                '''*Quran app*\nYou can develop it from my GitHub: github.com/itsherifahmed''');
            Navigator.pop(context);
          },
        ),
        _buildListTile(
          icon: Icons.rate_review,
          title: 'Rate',
          onTap: () async {
            if (!await launchUrl(quranAppUrl as Uri,
                mode: LaunchMode.externalApplication)) {
              throw 'Could not launch $quranAppUrl';
            }
          },
        ),
      ],
    );
  }

  Widget _buildListTile(
      {required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
