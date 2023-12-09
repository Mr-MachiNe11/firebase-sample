import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_sample/posts/add_post.dart';
import 'package:firebase_sample/ui/auth/login_screen.dart';
import 'package:firebase_sample/utils/utils.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  final databaseRef = FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                //logout
                auth.signOut().then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });
              },
              icon: const Icon(Icons.logout_outlined)),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: databaseRef,
              itemBuilder: (context, snapshot, animation, index) {
                return ListTile(
                  title: Text(snapshot.child('title').value.toString()),
                  subtitle: Text(snapshot.child('id').value.toString()),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddPostScreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
