import 'package:bonjour/resources/authentication/auth_method.dart';
import 'package:bonjour/utils/colors.dart';
import 'package:bonjour/widget/like_animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../providers/user_provider.dart';
import '../views/appscreens/widgetscrren/comment.dart';

class FeedItem extends StatefulWidget {
  const FeedItem({
    super.key,
    required this.menuAction,
    required this.snap,
  });

  final snap;
  final VoidCallback menuAction;

  // final bool isliked;
  @override
  State<FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  bool islikedAnimating = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // bool isliked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // User user = Provider.of<UserProvider>(context).getUser;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onDoubleTap: () {
              setState(() {
                islikedAnimating = !islikedAnimating;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // border: Border.all(color: Colors.white),
                    color: mobileBackgroundColor,
                    // color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.snap['postUrl']),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //image
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(widget.snap['profileImage']),
                            radius: 20,
                          ),

                          //username
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(widget.snap['username']),
                          ),
                        ],
                      ),
                      //menu
                      IconButton(
                          onPressed: widget.menuAction,
                          icon: const Icon(Icons.more_vert))
                    ],
                  ),
                ),

                //Like widget
                LikeAnimation(
                  isAnimating: islikedAnimating,
                  duration: const Duration(milliseconds: 400),
                  onEnd: () {
                    setState(() {
                      islikedAnimating = !islikedAnimating;
                    });
                  },
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 100,
                  ),
                )
              ],
            ),
          ),

          ///////////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //favourite

                  LikeAnimation(
                    isAnimating:
                        widget.snap['likes'].contains(_auth.currentUser!.uid),
                    smallLike: true,
                    child: IconButton(
                      icon: const Icon(Icons.favorite),
                      onPressed: () {},
                    ),
                  ),

                  //comment
                  IconButton(onPressed: () {}, icon: const Icon(Icons.comment)),
                  //Share
                  IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                ],
              ),

              //Save icon
              IconButton(onPressed: () {}, icon: const Icon(Icons.save))
            ],
          ),

          //description
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.snap['likes'].length}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                RichText(
                    text: TextSpan(
                        style: const TextStyle(color: primaryColor),
                        children: [
                      TextSpan(
                        // spellOut: true,
                        text: widget.snap['username'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: "  ${widget.snap['description']}")
                    ])),
                TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: false,
                          builder: (_) => const CommentScreen());
                    },
                    child: const Text("View all comment..")),
                //Date
                Container(
                  padding: const EdgeInsets.symmetric(),
                  child: Text(
                      //Getting date format from the db
                      DateFormat.yMMMd()
                          .format(widget.snap['datePublished'].toDate()) //
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
