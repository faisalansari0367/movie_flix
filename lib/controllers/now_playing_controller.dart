import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/movie_model.dart';
import '../services/http_service.dart';

class NowPlayingController extends GetxController {
  final _movies = <MovieModel>[].obs;
  final _controller = TextEditingController().obs;
  final _query = ''.obs;
  final _filteredList = <MovieModel>[];

  // ignore: invalid_use_of_protected_member
  List<MovieModel> get movies => query.isNotEmpty ? _filteredList : _movies.value;

  TextEditingController get controller => _controller.value;
  String get query => _query.value;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  void _setLoading(bool value) {
    _isLoading.value = value;
  }

  void removeItem(String id) {
    _movies.removeWhere((element) => element.id == id);
    onChanged(query);
  }

  @override
  void onInit() {
    _fetchTopRatedMovies();
    super.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onChanged(String q) {
    _query.value = q;
    // ignore: invalid_use_of_protected_member
    final fileteredMovies =
        _movies.value.where((element) => element.title.toLowerCase().contains(q.toLowerCase())).toList();
    _filteredList.clear();
    _filteredList.addAll(fileteredMovies);
  }

  void clearQuery() {
    _query.value = '';
    _controller.value.clear();
    // _movies.value = _moviesData;
  }

  Future<void> _fetchTopRatedMovies() async {
    try {
      _setLoading(true);
      final result = await HttpService.nowPlaying();
      final _moviesData = result.movies;
      _movies.value = _moviesData;
      _setLoading(false);
    } catch (e) {
      _setLoading(false);
    }
  }
}
