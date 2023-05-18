import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/photos.dart';

class PhotosService {
  Future<List<Photos>> getPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);

      return responseData.map((json) => Photos.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Pictures');
    }
  }
}
