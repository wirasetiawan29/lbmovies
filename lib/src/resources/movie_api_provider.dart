import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:lbmovie_app/src/models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  Future<ItemModel> fetchMovieList() async {
    Response response;
    response = await client.get("https://next.json-generator.com/api/json/get/Vk-iDmeTw");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}