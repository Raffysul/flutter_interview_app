import 'dart:convert';
import 'package:http/http.dart' as http;

class PhotoService {
  Future<void> _getPhotos() async {
    var client = http.Client;
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return
    }
    return null;
  }
}