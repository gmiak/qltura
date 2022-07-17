import 'package:flutter/material.dart';
import 'package:qltura/client/service/config/responsiveLayout/mobile_screen_layout.dart';
import 'package:qltura/client/service/utils/colors.dart';
import 'package:qltura/client/view/components/collection_avatar.dart';
import 'package:qltura/client/view/screens/add_post_screen.dart';

import '../components/appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: 'Qltura',
        iconButtons: iconButtons(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // My collections
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              height: 120,
              child: Center(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (Widget widget in tenCollectionsOnTop()) widget,
                    // Button add new collection
                    const CollectionAvatar(
                        title: "New",
                        imageLink: "assets/icons/add_collection.png",
                        pageLink: MobileScreenLayout())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Appbar
  List<IconButton> iconButtons(BuildContext context) {
    List<IconButton> buttons = <IconButton>[];
    // Add buttons 1
    buttons.add(
      IconButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const AddPostScreen(),
            ),
            (route) => false,
          );
        },
        icon: const Icon(
          Icons.add_circle_outline,
          color: logoColor,
          semanticLabel: 'Add',
          size: 25,
        ),
      ),
    );
    // Add buttons 2
    buttons.add(
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          color: logoColor,
          semanticLabel: 'Search',
          size: 25,
        ),
      ),
    );
    // Add buttons 3
    buttons.add(
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.email_outlined,
          color: logoColor,
          semanticLabel: 'Message',
          size: 25,
        ),
      ),
    );
    return buttons;
  }

  // Returns collection avatar
  List<Widget> tenCollectionsOnTop() {
    List<Widget> listWidget = <Widget>[];
    // Collection 1
    listWidget.add(const CollectionAvatar(
      title: "Musics",
      imageLink: "assets/music.png",
      pageLink: MobileScreenLayout(),
    ));
    listWidget.add(const SizedBox(width: 20.0));
    // Collection 2
    listWidget.add(const CollectionAvatar(
      title: "Movies",
      imageLink: "assets/movie.png",
      pageLink: MobileScreenLayout(),
    ));
    listWidget.add(const SizedBox(width: 20.0));
    // Collection 3
    listWidget.add(const CollectionAvatar(
      title: "Books",
      imageLink: "assets/book.png",
      pageLink: MobileScreenLayout(),
    ));
    listWidget.add(const SizedBox(width: 20.0));
    // Collection 4
    listWidget.add(const CollectionAvatar(
      title: "Watches",
      imageLink: "assets/watch.png",
      pageLink: MobileScreenLayout(),
    ));
    listWidget.add(const SizedBox(width: 20.0));
    // Collection 5
    listWidget.add(const CollectionAvatar(
      title: "Cars",
      imageLink: "assets/car.png",
      pageLink: MobileScreenLayout(),
    ));
    listWidget.add(const SizedBox(width: 20.0));
    // Collection 6
    listWidget.add(const CollectionAvatar(
      title: "Shoes",
      imageLink: "assets/shoes.png",
      pageLink: MobileScreenLayout(),
    ));
    listWidget.add(const SizedBox(width: 20.0));
    return listWidget;
  }
}
