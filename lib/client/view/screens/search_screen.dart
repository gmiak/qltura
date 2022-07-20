import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:qltura/client/service/utils/colors.dart';
import 'package:qltura/client/view/components/search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // Space
            SizedBox(height: 5),
            // Divider
            Divider(
              color: collectionAvatarBorderColor,
              height: 0.5,
            ),
            Text(
              "data",
              style: TextStyle(color: primaryColor),
            )
          ],
        ),
      ),
    );
  }

  // Page Appbar
  AppBar appBar() {
    return AppBar(
      backgroundColor: appBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          FeatherIcons.chevronLeft,
          color: logoColor,
        ),
        iconSize: 30,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: SearchBarComponent(searchTextController: _searchTextController),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(
            FeatherIcons.x,
            color: logoColor,
          ),
          iconSize: 30,
          onPressed: () {
            _searchTextController.clear();
          },
        ),
      ],
    );
  }
}
