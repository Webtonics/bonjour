import 'package:bonjour/widget/feed_item.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Instagram"),
          // title: Container(
          //     child: const Image(
          //         image: AssetImage("assets/images/ic_instagram.svg"))),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble),
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
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child:
                            FeedItem(image: 'assets/images/bonjour_full.png'),
                      );
                    }),
              ),
            )
          ],
        ));
  }
}
