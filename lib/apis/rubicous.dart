import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

Post post = Post(text: 'i am willinf', photosUrl: ['http://randomphotos.com']);
String baseUrl = 'http://rubicous-1-u0644790.deta.app';
upload() async {
  print('about to upload');
  var response = await http.get(Uri(
    scheme: 'http',
    host: baseUrl,
    path: '/styles/getmore',
  ));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('about to decode');
    var res = jsonDecode(response.body);
    print(response);
    // return res;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
