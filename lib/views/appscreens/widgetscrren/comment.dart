import 'package:bonjour/utils/colors.dart';
import 'package:bonjour/widget/comment_body.dart';
import 'package:bonjour/widget/textfield.dart';
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
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text("Comments"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            // Text("data"),
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return const Expanded(child: CommentCard());
                    // return ListTile(
                    //   leading: const CircleAvatar(
                    //     // backgroundImage: NetworkImage("url")
                    //     radius: 15,
                    //     backgroundColor: Colors.deepOrange,
                    //   ),
                    //   title: const Text(
                    //     "Mark rubbino",
                    //     style: TextStyle(
                    //         fontSize: 15, fontWeight: FontWeight.bold),
                    //   ),
                    //   subtitle: const Text(
                    //     "That is a beutiful artpiece, That is a beutiful artThat is a beutiful artpieceThat is a beutiful artpieceThat is a beutiful artpieceThat is a beutiful artpiece",
                    //     maxLines: 3,
                    //     style: TextStyle(
                    //         fontSize: 12, fontWeight: FontWeight.w600),
                    //   ),
                    //   trailing: IconButton(
                    //       onPressed: () {
                    //         setState(() {
                    //           isFav = !isFav;
                    //         });
                    //       },
                    //       icon: const Icon(Icons.favorite)),
                    // );
                  })),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Container(
        color: mobileBackgroundColor,
        height: kToolbarHeight,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CircleAvatar(
              // backgroundImage: NetworkImage("url"),
              backgroundColor: Colors.deepOrange,
              radius: 20,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: MyTextField(
                  controller: _commentController,
                  label: "Write Comment",
                  keyboardtype: TextInputType.text,
                  hint: " ",
                  obscure: false),
            ),
            const SizedBox(
              width: 5,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.send))
          ],
        ),
      )),
    );
  }
}
