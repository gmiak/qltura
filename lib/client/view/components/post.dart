import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../service/utils/colors.dart';

class PostView extends StatefulWidget {
  final String username;
  final String userProfilePicLink;
  final String imagePostLink;
  final int likes;
  final String postDescription;
  final String postTitle;
  final List comments;
  const PostView({
    Key? key,
    required this.username,
    required this.userProfilePicLink,
    required this.imagePostLink,
    required this.likes,
    required this.postTitle,
    required this.postDescription,
    required this.comments,
  }) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Username and user profile pic
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Userprofile & Username
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: appBackgroundColor,
                    radius: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(widget.userProfilePicLink),
                    ),
                  ),
                  // Space
                  const SizedBox(width: 8.0),
                  // username
                  Text(
                    widget.username,
                    style: const TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  )
                ],
              ),

              // Post's settings
              InkWell(
                  onTap: () {},
                  child: const Icon(
                    FeatherIcons.moreHorizontal,
                    color: primaryColor,
                  ))
            ],
          ),
        ),
        // Space
        const SizedBox(height: 10.0),
        // Image that describes the post
        Container(
          width: MediaQuery.of(context).size.width,
          height: 400,
          decoration: const BoxDecoration(
            color: appBackgroundColor,
            border: Border.symmetric(
              horizontal:
                  BorderSide(color: collectionAvatarBorderColor, width: 0.4),
            ),
          ),
          child: Image.asset(widget.imagePostLink),
        ),
        // Space
        const SizedBox(height: 10.0),
        // Likes, comments, send to someone
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Userprofile & Username
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Like
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      FeatherIcons.heart,
                      color: primaryColor,
                      size: 23,
                    ),
                  ),
                  // Space
                  const SizedBox(width: 12),
                  // comment
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      FeatherIcons.messageCircle,
                      color: primaryColor,
                      size: 23,
                    ),
                  ),
                  // Space
                  const SizedBox(width: 12),
                  // add to your collection
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      FeatherIcons.plus,
                      color: primaryColor,
                      size: 25,
                    ),
                  ),
                ],
              ),

              // Post's settings
              InkWell(
                  onTap: () {},
                  child: const Icon(
                    FeatherIcons.send,
                    color: primaryColor,
                  ))
            ],
          ),
        ),
        // Space
        const SizedBox(height: 6.0),
        // Number of likes
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Likes
              Text(
                widget.likes.toString(),
                style: const TextStyle(
                    color: primaryColor, fontWeight: FontWeight.bold),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: const Text(
                    "likes",
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
        // Space
        const SizedBox(height: 6.0),
        // Description
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Username & post title
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Likes
                  Text(
                    widget.username,
                    style: const TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: Text(
                      widget.postTitle,
                      style: const TextStyle(color: textColor),
                    ),
                  ),
                ],
              ),
              // Post description
              Text(
                widget.postDescription,
                style: const TextStyle(color: textColor),
              ),
              const SizedBox(height: 6.0),
              // Comment link
              const Text(
                "View all 67 comments",
                style: TextStyle(color: textVersionLightColor, fontSize: 11),
              ),
              // Date
              const Text(
                "2 days ago .",
                style: TextStyle(color: textVersionLightColor, fontSize: 11),
              ),
            ],
          ),
        ),
        // Space with next post
        const SizedBox(height: 24.0),
      ],
    );
  }
}
