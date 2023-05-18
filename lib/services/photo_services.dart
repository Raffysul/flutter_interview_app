import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/photos.dart';

  Future<Photos> getPhotos() async {
   final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      return Photos.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Pictures');
    }

  }