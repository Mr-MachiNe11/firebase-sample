import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_sample/utils/utils.dart';
import 'package:firebase_sample/widgets/round_button.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final databaseRef = FirebaseDatabase.instance.ref('Post');
  bool loading = false;
  final postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: postController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'What is in your mind?',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundButton(
              loading: loading,
                title: 'Add',
                onTap: () {
                  setState(() {
                    loading = true;
                  });
                  databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
                    'title': postController.text.toString(),
                    'id': DateTime.now().microsecondsSinceEpoch,
                  }).then((value) {
                    Utils().toastMessage('Post Added');
                    setState(() {
                      loading = false;
                    });
                  }).onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                    setState(() {
                      loading = false;
                    });
                  });
                }),
          ],
        ),
      ),
    );
  }
}
