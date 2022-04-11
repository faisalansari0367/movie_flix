// import 'package:http/http.dart' as http;
// import 'package:shopme/src/models/product_models.dart';

import 'dart:convert';

import 'package:movie_flix/services/api_methods.dart';

import '../models/movie_model.dart';

class HttpService {
  static Future<MovieModelList> nowPlaying() async {
    final response = await ApiMethods.get('3/movie/now_playing');

    final json = jsonDecode(response.body);
    final data = MovieModelList.fromJson(json['results']);
    return data;
  }

  static Future<MovieModelList> topRated() async {
    final response = await ApiMethods.get('3/movie/top_rated');
    final json = jsonDecode(response.body);
    final data = MovieModelList.fromJson(json['results']);
    return data;
  }
}
