import 'package:bonjour/utils/colors.dart';
import 'package:flutter/material.dart';

class FeedItem extends StatelessWidget {
  const FeedItem(
      {super.key,
      required this.image,
      required this.userProfileImage,
      required this.username,
      required this.menuAction,
      required this.favoriteAction,
      required this.commentAction,
      required this.shareAction,
      required this.saveAction});

  final String image;
  final String userProfileImage;
  final String username;
  final VoidCallback menuAction;
  final VoidCallback favoriteAction;
  final VoidCallback commentAction;
  final VoidCallback shareAction;
  final VoidCallback saveAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white),
        color: mobileBackgroundColor,
        // color: Colors.white,
        image: DecorationImage(
          image: AssetImage(image),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //image
                  CircleAvatar(
                    backgroundImage: NetworkImage(userProfileImage),
                    radius: 20,
                  ),
                  //username
                  Text(username),
                ],
              ),
              //menu
              IconButton(onPressed: menuAction, icon: const Icon(Icons.menu))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //favourite
                  IconButton(
                      onPressed: favoriteAction,
                      icon: const Icon(Icons.favorite)),
                  //comment
                  IconButton(
                      onPressed: commentAction,
                      icon: const Icon(Icons.comment)),
                  //Share
                  IconButton(
                      onPressed: shareAction, icon: const Icon(Icons.share)),
                ],
              ),

              //Save icon
              IconButton(onPressed: saveAction, icon: const Icon(Icons.save))
            ],
          )
        ],
      ),
    );
  }
}
