import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.deepOrange,
            radius: 15,
          ),
          Column(
            children: const [
              const Text(
                "username",
                style: TextStyle(fontSize: 15),
              ),
              const Text(
                "comment is here this is the comment",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
        ],
      ),
    );
  }
}
