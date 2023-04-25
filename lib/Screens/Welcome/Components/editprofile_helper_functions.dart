// ignore_for_file: use_build_context_synchronously, duplicate_ignore, unused_import

import 'package:final_project/Screens/Welcome/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:final_project/Screens/Welcome/edit_profile.dart';

var headers = {'Content-Type': 'application/json'};

Future<void> updateProfile(
  BuildContext context,
  String email,
  String dob,
  String yearGroup,
  String major,
  String campusResidence,
  String favouriteFood,
  String favouriteMovie,
  String username,
) async {
  String url = 'http://127.0.0.1:5000/profile/$email';
  var request = http.Request('PATCH', Uri.parse(url));

  request.body = json.encode({
    "dob": dob,
    "favouriteFood": favouriteFood,
    "favouriteMovie": favouriteMovie,
    "yearGroup": yearGroup,
    "major": major,
    "username": username,
    "campusResidence": campusResidence,
    "email": email,
  });

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }
  if (response.statusCode == 400) {
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("Error"),
            content: Text("Your profile has not been updated"),
          );
        });
  }
}
