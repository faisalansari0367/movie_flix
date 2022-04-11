import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/movie_model.dart';
import '../services/http_service.dart';

class NowPlayingController extends GetxController {
  final _movies = <MovieModel>[].obs;
  final _controller = TextEditingController().obs;
  final _query = ''.obs;
  var _moviesData = <MovieModel>[];

  // ignore: invalid_use_of_protected_member
  List<MovieModel> get movies => _movies.value;

  TextEditingController get controller => _controller.value;
  String get query => _query.value;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  void _setLoading(bool value) {
    _isLoading.value = value;
  }

  void removeItem(int index) {
    _movies.removeAt(index);
  }

  @override
  void onInit() {
    _fetchTopRatedMovies();
    super.onInit();
  }

  // @override
  // void dispose() {
  //   // controller.dispose();
  //   super.dispose();
  // }

  void onChanged(String q) {
    _query.value = q;
    final fileteredMOvies = movies.where((element) => element.title.toLowerCase().contains(q)).toList();
    if (q.isNotEmpty) {
      _movies.value = fileteredMOvies.toList();
    } else {
      _movies.value = _moviesData;
    }
  }

  void clearQuery() {
    _query.value = '';
    _controller.value.clear();
  }

  Future<void> _fetchTopRatedMovies() async {
    try {
      _setLoading(true);
      final result = await HttpService.nowPlaying();
      _moviesData = result.movies;
      _movies.value = _moviesData;
      _setLoading(false);
    } catch (e) {
      _setLoading(false);
    }
  }
}
