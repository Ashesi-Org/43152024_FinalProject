// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var headers = {'Content-Type': 'application/json'};

Future<void> createPost(BuildContext context, String email, String post) async {
  String url = 'http://127.0.0.1:5000/post';
  var request = http.Request('POST', Uri.parse(url));
  request.headers.addAll(headers);
  request.body = json.encode({
    "email": email,
    "post": post,
  });

  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    print("Success");
  }
}
