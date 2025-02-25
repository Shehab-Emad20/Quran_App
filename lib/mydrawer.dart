import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ytquran/settings.dart';

import 'constant.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                Image.asset(
                  'assets/quran.png',
                  height: 80,
                ),
                const Text(
                  'Al Quran',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
            ),
            title: Text(
              'Settings',
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Settings()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.share,
            ),
            title: Text(
              'Share',
            ),
            onTap: () {
              Share.share('''*Quran app*\n
u can develop it from my github github.com/itsherifahmed ''');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.rate_review,
            ),
            title: Text(
              'Rate',
            ),
            onTap: () async {
              if (!await launchUrl(quranAppurl,
                  mode: LaunchMode.externalApplication)) {
                throw 'Could not launch $quranAppurl';
              }
            },
          ),
        ],
      ),
    );
  }
}
