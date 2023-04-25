// ignore_for_file: use_build_context_synchronously, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:final_project/Screens/Welcome/login_page.dart';

var headers = {'Content-Type': 'application/json'};

Future<void> createUser(
  BuildContext context,
  String name,
  String email,
  String id,
  String dob,
  String yearGroup,
  String major,
  String campusResidence,
  String favouriteFood,
  String favouriteMovie,
  String username,
  String password,
  String confirmPassword,
) async {
  String url = 'http://127.0.0.1:5000/profile';
  var request = http.Request('POST', Uri.parse(url));

  request.body = json.encode({
    "name": name,
    "email": email,
    "password": password,
    "confirmPassword": confirmPassword,
    "dob": dob,
    "id": id,
    "favouriteFood": favouriteFood,
    "favouriteMovie": favouriteMovie,
    "yearGroup": yearGroup,
    "major": major,
    "username": username,
    "campusResidence": campusResidence
  });

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }
  if (response.statusCode == 400) {
    // ignore: use_build_context_synchronously
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text("Error"),
            content: Text("Your profile has not been created"),
          );
        });
  }
}
