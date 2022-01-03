import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Network {
  Network(this.url);

  final String url;

  Future networkData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      return decodeData;

      // print(data);

    } else {
      response.statusCode;
      print(response.statusCode);
    }
  }
}
