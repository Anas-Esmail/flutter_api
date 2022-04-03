import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class api extends StatelessWidget {
  final String name;
  Future<api> fetchAlbum() async {
    final response = await http.get(
      Uri.parse('https://restaurant.partner-cons.com/api/resource/Employee'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader:
            'token 5419a0f86eee73f:b1628d468cafa64',
      },
    );
    final responseJson = jsonDecode(response.body);

    return api.fromJson(responseJson);
  }

  const api({
    this.name,
  });

  factory api.fromJson(Map<String, dynamic> json) {
    return api(
      name: json['name'],
    );
  }

  @override
  Widget build(BuildContext responseJson) {
    return Scaffold(
      body: Text('$name'),
    );
  }
}
