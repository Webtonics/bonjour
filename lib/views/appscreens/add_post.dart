import 'dart:typed_data';

import 'package:bonjour/providers/user_provider.dart';
import 'package:bonjour/utils/colors.dart';
import 'package:bonjour/utils/uploader/image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  selectImage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Create post"),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickimage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
                child: const Text("Take Photo"),
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickimage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
                child: const Text("Choose from Gallery"),
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return _file == null
        ? Center(
            child: IconButton(
                onPressed: () {
                  selectImage(context);
                },
                icon: const Icon(Icons.upload)),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back,
                  size: 25,
                ),
              ),
              centerTitle: false,
              title: const Text("Post to"),
              actions: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Post",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ))
              ],
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.photoUrl),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Write a caption",
                          border: InputBorder.none,
                        ),
                        maxLines: 8,
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: MemoryImage(_file!),
                                fit: BoxFit.fill,
                                alignment: FractionalOffset.topCenter),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
