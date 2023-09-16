import 'package:flutter/material.dart';

showalertDialog(BuildContext context, String content) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('An Error Occured'),
        icon: const Icon(Icons.cancel_outlined),
        content: Text(content),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Exit"))
        ],
      );
    },
  );
}
