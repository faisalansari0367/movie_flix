import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flix/models/movie_model.dart';
import 'package:movie_flix/services/http_service.dart';

class TopRatedController extends GetxController {
  final _movies = <MovieModel>[].obs;
  // ignore: invalid_use_of_protected_member
  final _controller = TextEditingController().obs;
  get controller => _controller.value;
  final _query = ''.obs;
  final _filteredList = <MovieModel>[];

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  String get query => _query.value;

  
  // ignore: invalid_use_of_protected_member
  List<MovieModel> get movies => query.isNotEmpty ? _filteredList : _movies.value;

  void _setLoading(bool value) {
    _isLoading.value = value;
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

  void removeItem(String id) {
    _movies.removeWhere((element) => element.id == id);
    onChanged(query);
  }

  void onChanged(String q) {
    _query.value = q;
    // ignore: invalid_use_of_protected_member
    final fileteredMovies = _movies.value.where((element) => element.title.toLowerCase().contains(q.toLowerCase())).toList();
    _filteredList.clear();
    _filteredList.addAll(fileteredMovies);
  }

  void clearQuery() {
    _query.value = '';
    _controller.value.clear();
  }

  Future<void> _fetchTopRatedMovies() async {
    try {
      _setLoading(true);
      final result = await HttpService.topRated();
      // _moviesData = result.movies;
      _movies.value = result.movies;
      _setLoading(false);
    } on Exception catch (_) {
      _setLoading(false);
    }
  }
}
