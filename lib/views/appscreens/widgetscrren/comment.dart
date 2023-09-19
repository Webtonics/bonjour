import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController _commentController = TextEditingController();
  bool isFav = false;

  @override
  void initState() {
    _commentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        children: [
          ListView.builder(
              itemCount: 30,
              itemBuilder: ((context, index) {
                ListTile(
                  leading:
                      const CircleAvatar(backgroundImage: NetworkImage("url")),
                  title: const Text("Mark rubbino"),
                  subtitle: const Text("That is a beutiful artpiece"),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          isFav = !isFav;
                        });
                      },
                      icon: const Icon(Icons.favorite)),
                );
              })),
          const TextField()
        ],
      ),
    );
  }
}
