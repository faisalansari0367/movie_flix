import 'dart:convert';
import 'dart:io';

import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;

class ApiMethods {
  static const _apiKey = 'a07e22bc18f5cb106bfe4cc1f83ad8ed';
  static const _domain = 'api.themoviedb.org';

  static Future<http.Response> get(String endpoint, {Map<String, String>? headers, Encoding? encoding}) async {
    try {
      final params = {'api_key': _apiKey};
      final uri = Uri.https(_domain, endpoint, params);
      final response = await http.get(uri);
      return response;
    } on SocketException catch (_) {
      Get.snackbar('No internet connection', 'Please enable your internet connection first');
      return http.Response('', 404);
    } catch (e) {
      rethrow;
    }
  }
}
