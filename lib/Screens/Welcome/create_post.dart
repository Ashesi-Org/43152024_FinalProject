// ignore_for_file: library_private_types_in_public_api, unused_import, unused_local_variable

import 'package:final_project/Screens/Welcome/Components/feedpage_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Screens/Welcome/Components/createpost_helper_functions.dart';
import 'package:provider/provider.dart';
import 'package:final_project/Screens/Welcome/user_provider.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  bool _isTweetButtonDisabled = true;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String email = Provider.of<UserProvider>(context, listen: false).userEmail;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Create a Post'),
        actions: [
          ElevatedButton(
            onPressed: _isTweetButtonDisabled
                ? null
                : () {
                    createPost(context, email, _textController.text);
                    _textController.clear();
                  },
            child: Text(
              'POST',
              style: TextStyle(
                color: _isTweetButtonDisabled ? Colors.grey : Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/edit-profile.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/images/logo-3.png',
                width: 150.0,
                height: 100.0,
              ),
              const SizedBox(height: 5.0),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 600,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1.0)),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 500,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _textController,
                              onChanged: (value) {
                                setState(() {
                                  _isTweetButtonDisabled =
                                      value.isEmpty || value.length > 280;
                                });
                              },
                              maxLines: null,
                              decoration: const InputDecoration(
                                hintText: "What's happening?",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.photo_camera),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.insert_emoticon),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.location_on),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.more_horiz),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(child: FeedPage()),
            ],
          ),
        ),
      ),
    );
  }
}
