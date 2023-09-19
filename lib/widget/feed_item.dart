import 'package:flutter/material.dart';

class FeedItem extends StatelessWidget {
  const FeedItem({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        // color: Colors.white,
        image: DecorationImage(
          image: AssetImage(image),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              //image
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/defaultprofile.png'),
                radius: 20,
              ),
              //username
              Text("Emmanuel"),
            ],
          ),
          //menu
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
        ],
      ),
    );
  }
}
