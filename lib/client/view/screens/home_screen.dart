import 'package:flutter/material.dart';
import 'package:qltura/client/service/config/responsiveLayout/mobile_screen_layout.dart';
import 'package:qltura/client/service/utils/colors.dart';
import 'package:qltura/client/service/utils/utils_uno.dart';
import 'package:qltura/client/view/components/collection_avatar.dart';
import 'package:qltura/client/view/components/post_view.dart';

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
            SizedBox(
              height: 100,
              child: Center(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
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
            ),
            const Divider(color: collectionAvatarBorderColor),
            const SizedBox(height: 6.0),
            // Posts
            for (PostView post in postList()) post,
          ],
        ),
      ),
    );
  }

  // Appbar
  List<IconButton> iconButtons(BuildContext context) {
    List<IconButton> buttons = <IconButton>[];
    // Add buttons 1
    buttons.add(getBtnAdd(context));
    // Add buttons 2
    buttons.add(getBtnSearch(context));
    // Add buttons 3
    buttons.add(getBtnMessage(context));
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

  // Returns a list of posts
  List<PostView> postList() {
    List<PostView> listPost = <PostView>[];
    // Post 1
    listPost.add(const PostView(
        username: "gmiak",
        userProfilePicLink: "assets/profile.png",
        imagePostLink: "assets/car1.png",
        likes: 50,
        postTitle: "Lamborghini Huracan",
        postDescription:
            "The latest member of the Huracán range provides the purest Lamborghini driving experience combined with the freedom of everyday use!",
        comments: []));

    // Post 2
    listPost.add(const PostView(
        username: "gmiak",
        userProfilePicLink: "assets/profile.png",
        imagePostLink: "assets/profile.png",
        likes: 50,
        postTitle: "New profile pic",
        postDescription: "This is so cool!",
        comments: []));
    return listPost;
  }
}
