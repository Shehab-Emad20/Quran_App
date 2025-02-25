import 'package:flutter/material.dart';
import 'package:ytquran/constant.dart';
import 'package:ytquran/core/utils/widgets/app_bar.dart';
import 'package:ytquran/core/utils/widgets/bookmark_button.dart';
import 'package:ytquran/presentation/view/widgets/index_body.dart';
import 'package:ytquran/presentation/view/widgets/my_drawer.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      floatingActionButton: BookmarkButton(),
      appBar: buildAppBar(),
      body: FutureBuilder(
        future: readJson(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading data'));
          } else if (snapshot.hasData) {
            return IndexBody(quran: snapshot.data);
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
