import 'package:bonjour/models/user.dart';
import 'package:bonjour/providers/post_provider.dart';
import 'package:bonjour/utils/colors.dart';
import 'package:bonjour/views/profile.dart';
import 'package:bonjour/widget/alert_dialog.dart';
import 'package:bonjour/widget/feed_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../models/post.dart';
import '../../providers/user_provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).getUser;
    // Post post = Provider.of<PostProvider>(context).getPost;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title: Padding(
            padding: const EdgeInsets.only(top: 7),
            child: SvgPicture.asset(
              "assets/images/ic_instagram.svg",
              color: primaryColor,
            ),
          ),
          // title: Container(
          //     child: const Image(
          //         image: AssetImage("assets/images/ic_instagram.svg"))),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.messenger),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: ListView.builder(
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FeedItem(
                          image: 'assets/images/bonjour_full.png',
                          menuAction: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ProfileScreen()));
                          },
                          userProfileImage: user.photoUrl,
                          username: user.username,
                          commentAction: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ProfileScreen()));
                          },
                          favoriteAction: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ProfileScreen()));
                          },
                          saveAction: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ProfileScreen()));
                          },
                          shareAction: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ProfileScreen()));
                          },
                        ),
                      );
                    }),
              ),
            )
          ],
        ));
  }
}
