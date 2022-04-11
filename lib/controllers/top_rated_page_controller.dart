import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flix/models/movie_model.dart';
import 'package:movie_flix/services/http_service.dart';

class TopRatedController extends GetxController {
  final _movies = <MovieModel>[].obs;
  // ignore: invalid_use_of_protected_member
  List<MovieModel> get movies => _movies.value;
  final _controller = TextEditingController().obs;
  get controller => _controller.value;
  final _query = ''.obs;
  var _moviesData = <MovieModel>[];

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  void _setLoading(bool value) {
    _isLoading.value = value;
  }

  String get query => _query.value;

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

  void removeItem(int index) {
    _movies.removeAt(index);
  }

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
      final result = await HttpService.topRated();
      _moviesData = result.movies;
      _movies.value = _moviesData;
      _setLoading(false);
    } on Exception catch (_) {
      _setLoading(false);
    }
  }
}
