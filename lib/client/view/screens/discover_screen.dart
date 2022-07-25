import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:qltura/client/view/components/grid_view.dart';
import 'package:qltura/client/view/components/search_bar.dart';
import '../../service/utils/colors.dart';
import '../../service/utils/global_variables.dart';
import '../components/grid_view.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final List<String> showedItems = searchList();
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(height: 5.0),
          PostGridView(items: showedItems),
        ],
      )),
    );
  }

  // Page Appbar
  AppBar appBar() {
    return AppBar(
      backgroundColor: appBackgroundColor,
      elevation: 0,
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
