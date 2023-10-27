import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

class HttpRequests {
  final String _url = 'https://api.sampleapis.com/coffee/hot';
  var client = http.Client();

  Future<List?> getAllProducts() async {
    var url = Uri.parse(_url);

    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(jsonDecode(response.body));
      }
    } catch (e) {
      print('error $e');
    }
    return null;
  }

  Future  getSingleProducts(id) async {
    var url = Uri.parse('$_url/$id');

    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        
        return jsonDecode(response.body);
      } else {
        print(jsonDecode(response.body));
      }
    } catch (e) {
      print('error $e');
    }
  }
}
