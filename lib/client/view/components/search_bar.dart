import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:qltura/client/service/utils/colors.dart';

class SearchBarComponent extends StatelessWidget {
  final TextEditingController searchTextController;
  const SearchBarComponent({Key? key, required this.searchTextController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        child: TextField(
          controller: searchTextController,
          style: const TextStyle(color: textFieldInputTextColor),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: barSearchTextColor, fontSize: 12),
            prefixIcon: Icon(
              FeatherIcons.search,
              color: barSearchIconColor,
              size: 18,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: primaryColor, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: textFieldBorderSideColor),
            ),
            contentPadding: EdgeInsets.all(5.0),
            filled: true,
            fillColor: barSearchFilledColor,
          ),
        ),
      ),
    );
  }
}
