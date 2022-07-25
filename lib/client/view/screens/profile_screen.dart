import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qltura/client/service/utils/utils_uno.dart';
import 'package:qltura/client/view/components/search_bar.dart';
import '../../service/config/responsiveLayout/mobile_screen_layout.dart';
import '../../service/utils/colors.dart';
import '../../service/utils/global_variables.dart';
import '../components/appbar.dart';
import '../components/collection_avatar.dart';
import '../components/grid_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Uint8List? _image;
  final TextEditingController _searchTextController = TextEditingController();
  final List<String> showedItems = searchList();
  // Select profile image
  void selectImage() async {
    Uint8List? pic = await pickImage(ImageSource.gallery);
    setState(() {
      _image = pic;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        title: 'gmiak',
        iconButtons: iconButtons(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Space
            const SizedBox(height: 5),
            // Divider
            const Divider(
              color: collectionAvatarBorderColor,
              height: 0.5,
            ),
            // User profile pic, posts, followers, following
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile pic
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 50,
                                backgroundImage: MemoryImage(_image!),
                              )
                            : CircleAvatar(
                                backgroundColor: appBackgroundColor,
                                radius: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Image.asset('assets/profile.png'),
                                ),
                              ),
                        Positioned(
                          bottom: 3,
                          left: 72,
                          child: Container(
                            width: 30,
                            height: 30,
                            padding: const EdgeInsets.all(2.0),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: appBackgroundColor),
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: blueColor),
                              child: InkWell(
                                onTap: selectImage,
                                child: const Icon(
                                  FeatherIcons.plus,
                                  color: appBackgroundColor,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Followers, Following
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.58,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Post
                        Column(
                          children: const [
                            Text(
                              "24",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Posts",
                              style: TextStyle(color: textColor),
                            ),
                          ],
                        ),
                        // Followers
                        Column(
                          children: const [
                            Text(
                              "140",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(color: textColor),
                            ),
                          ],
                        ),
                        // Following
                        Column(
                          children: const [
                            Text(
                              "150",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Following",
                              style: TextStyle(color: textColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // username
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: const Text(
                "Georges Miaka",
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            // space
            const SizedBox(height: 3),
            // bio
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: const Text(
                "- Emelie & Elise E^2\n- B.Sc Information Technology\n- Travel, Adventure, Photo.",
                style: TextStyle(color: textColor),
                maxLines: 4,
              ),
            ),
            // space
            const SizedBox(height: 15.0),
            // Search
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SizedBox(
                height: 35,
                child: SearchBarComponent(
                    searchTextController: _searchTextController),
              ),
            ),
            // space
            const SizedBox(height: 15.0),
            // Show user collection
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
            // space
            const SizedBox(height: 15.0),
            // Show user content
            PostGridView(items: showedItems),
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
    buttons.add(getBtnManageAccount(context));
    // Add buttons 3
    buttons.add(getBtnSearch(context));
    return buttons;
  }
}
