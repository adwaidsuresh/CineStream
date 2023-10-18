import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/modelclass/castindividual.dart';
import 'package:movieapp/modelclass/castmoviemodel.dart';
import 'package:movieapp/modelclass/detailmovie.dart';
import 'package:movieapp/modelclass/modelclass.dart';
import 'package:movieapp/modelclass/tvtoprated.dart';
// import 'package:movieapp/view/castdetails.dart';

class ApiService {
  Dio dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {"api_key": "6628ecca3a10b525706cc87d7b2b0149"},
  ));

  Future<MovieModel?> getPosts() async {
    try {
      Response response = await dio.get('/movie/popular');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('error:$e');
    }
    return null;
  }

  Future<MovieModel?> getTrendingMovies() async {
    try {
      Response response = await dio.get('/movie/upcoming');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('erroe$e');
    }
    return null;
  }

  Future<MovieModel?> getNowplaying() async {
    try {
      Response response = await dio.get('/movie/now_playing');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
      return null;
    } on DioException catch (e) {
      log('Error:$e');
    }
    return null;
  }

  Future<CastMovieModel?> getCasting(int movieid) async {
    try {
      Response response = await dio.get('/movie/$movieid/credits');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return castMovieModelFromJson(json);
      }
    } on DioException catch (e) {
      log('$e');
    }
    return null;
  }

  Future<DetailMovieModel?> getdetail(int movie_id) async {
    try {
      Response response = await dio.get('/movie/$movie_id');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return detailMovieModelFromJson(json);
      }
    } on DioException catch (e) {
      log('error$e');
    }
    return null;
  }

  Future<Castindividual?> getcastDetails(int person_id) async {
    try {
      Response response = await dio.get('/person/$person_id');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return castindividualFromJson(json);
      }
    } on DioException catch (e) {
      log('error$e');
    }
    return null;
  }

  Future<MovieModel?> getSearchDetails(String movieName) async {
    try {
      Response response =
          await dio.get('/search/movie', queryParameters: {"query": movieName});
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return movieModelFromJson(json);
      }
    } on DioException catch (e) {
      log('error$e');
    }
    return null;
  }

  Future<TvTopRated?> gettvtoprated() async {
    try {
      Response response = await dio.get('/tv/top_rated');
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return tvTopRatedFromJson(json);
      }
    } on DioException catch (e) {
      log('error$e');
    }
    return null;
  }
}
