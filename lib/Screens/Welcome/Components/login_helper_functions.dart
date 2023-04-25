// ignore_for_file: use_build_context_synchronously, duplicate_ignore, unused_import

import 'package:final_project/Screens/Welcome/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:final_project/Screens/Welcome/user_provider.dart';

var headers = {'Content-Type': 'application/json'};

Future<void> userLogin(
    BuildContext context, String email, String password) async {
  String url = 'http://127.0.0.1:5000/login';
  var request = http.Request('POST', Uri.parse(url));

  request.body = json.encode({"email": email, "password": password});

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // ignore: use_build_context_synchronously
    // ignore: unused_local_variable
    final loginResponse = jsonDecode(await response.stream.bytesToString());

    Provider.of<UserProvider>(context, listen: false)
        .setuserEmail(loginResponse['email']);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ProfilePage()));
  } else if (response.statusCode == 409) {
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Please enter your email and password"),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  } else {
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Wrong email or password"),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
