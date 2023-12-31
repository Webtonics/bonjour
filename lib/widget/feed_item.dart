import 'package:bonjour/providers/user_provider.dart';
import 'package:bonjour/resources/firestore_methods.dart';
import 'package:bonjour/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../views/appscreens/widgetscrren/comment.dart';
import 'like_animation.dart';

class FeedItem extends StatefulWidget {
  const FeedItem({
    super.key,
    required this.image,
    required this.userProfileImage,
    required this.username,
    required this.menuAction,
    // required this.favoriteAction,
    required this.commentAction,
    required this.shareAction,
    required this.saveAction,
    required this.snap,
    // required this.isliked,
  });

  final String image;
  final String userProfileImage;
  final String username;
  final snap;
  final VoidCallback menuAction;
  // final VoidCallback favoriteAction;
  final VoidCallback commentAction;
  final VoidCallback shareAction;
  final VoidCallback saveAction;
  // final bool isliked;
  @override
  State<FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  bool isliked = false;
  bool isLikeAnimating = false;
  @override
  void initState() {
    // bool isliked = false;
    super.initState();
  }
  // isLikeAnimating(){}

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<UserProvider>(context).getUser;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onDoubleTap: () async {
              setState(() {
                isLikeAnimating = true;
                isliked = !isliked;
              });
              FirestoreMethods().likePost(user!.uid,
                  widget.snap['postId'].toString(), widget.snap['likes']);
            },
            child: Stack(alignment: Alignment.center, children: [
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
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isLikeAnimating ? 1 : 0,
                child: LikeAnimation(
                    onEnd: () {
                      setState(() {
                        isLikeAnimating = false;
                      });
                    },
                    isAnimating: isLikeAnimating,
                    duration: const Duration(milliseconds: 400),
                    child: const Icon(
                      Icons.favorite,
                      size: 100,
                      color: Colors.redAccent,
                    )),
              )
            ]),
          ),

          //Comment, Like sections
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //favourite

                  LikeAnimation(
                    smallLike: true,
                    isAnimating: widget.snap['likes'].contains(user!.uid),
                    child: IconButton(
                        onPressed: () async {
                          setState(() {
                            isliked = !isliked;
                          });
                          FirestoreMethods().likePost(
                              user.uid,
                              widget.snap['postId'].toString(),
                              widget.snap['likes']);
                        },
                        icon: isliked
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite,
                              )),
                  ),

                  //comment
                  IconButton(
                      onPressed: widget.commentAction,
                      icon: const Icon(Icons.comment)),
                  //Share
                  IconButton(
                      onPressed: widget.shareAction,
                      icon: const Icon(Icons.share)),
                ],
              ),

              //Save icon
              IconButton(
                  onPressed: widget.saveAction, icon: const Icon(Icons.save))
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
