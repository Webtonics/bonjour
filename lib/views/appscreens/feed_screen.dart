import 'package:bonjour/models/user.dart';
import 'package:bonjour/utils/colors.dart';
import 'package:bonjour/views/profile.dart';
import 'package:bonjour/widget/feed_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    // User user = Provider.of<UserProvider>(context).getUser;
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
        body: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('posts')
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                          child:
                              const Center(child: CircularProgressIndicator()));
                    }

                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FeedItem(
                              snap: snapshot.data!.docs[index].data(),
                              menuAction: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        child: ListView(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 16),
                                            shrinkWrap: true,
                                            children: [
                                              "Delete",
                                            ]
                                                .map((e) => InkWell(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 12,
                                                                horizontal: 16),
                                                        child: Text(e),
                                                      ),
                                                    ))
                                                .toList()),
                                      );
                                    });
                              },
                            ),
                          );
                        });
                  }),
            ),
          )
        ]));
  }
}
