// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var headers = {'Content-Type': 'application/json'};

Future<Map<String, dynamic>> viewProfile(String email) async {
  String url = 'http://127.0.0.1:5000/profile';
  url = Uri.parse(url).replace(queryParameters: {'email': email}).toString();
  var request = http.Request('GET', Uri.parse(url));

  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var profileResponse = json.decode(await response.stream.bytesToString());
    return profileResponse;
  } else {
    return {
      "name": "Error",
      "email": "Error",
      "password": "Error",
      "confirmPassword": "Error",
      "dob": "Error",
      "id": "Error",
      "favouriteFood": "Error",
      "favouriteMovie": "Error",
      "yearGroup": "Error",
      "major": "Error",
      "username": "Error",
      "campusResidence": "Error"
    };
  }
}
