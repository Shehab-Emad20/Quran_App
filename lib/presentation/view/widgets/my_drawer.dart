import 'package:flutter/material.dart';
import 'package:ytquran/presentation/view/widgets/drawer_items.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/quran.png'),
                  height: 80,
                ),
                Text(
                  'Al Quran',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          DrawerItems(),
        ],
      ),
    );
  }
}
