import 'package:flutter/material.dart';

class PostGridView extends StatefulWidget {
  final List<String> items;
  const PostGridView({Key? key, required this.items}) : super(key: key);

  @override
  State<PostGridView> createState() => _PostGridViewState();
}

class _PostGridViewState extends State<PostGridView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GridView.count(
        crossAxisCount: 3,
        children: [
          for (int i = 0; i < widget.items.length; i++)
            Container(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(widget.items[i]),
            )
        ],
      ),
    );
  }
}
