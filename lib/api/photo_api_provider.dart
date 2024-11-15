import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/photo.dart';

class PhotoApiProvider {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<Photo>> fetchPhotos() async {
    final response = await http.get(Uri.parse('$baseUrl/photos'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
