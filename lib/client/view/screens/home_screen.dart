import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:qltura/client/service/config/responsiveLayout/mobile_screen_layout.dart';
import 'package:qltura/client/service/utils/colors.dart';
import 'package:qltura/client/view/components/collection_avatar.dart';
import 'package:qltura/client/view/components/post.dart';
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
          FeatherIcons.plusCircle,
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
          FeatherIcons.search,
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
          FeatherIcons.mail,
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

  // Returns a list of posts
  List<PostView> postList() {
    List<PostView> listPost = <PostView>[];
    // Post 1
    listPost.add(const PostView(
        username: "gmiak",
        userProfilePicLink: "assets/profile.png",
        imagePostLink: "assets/lambo.png",
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
