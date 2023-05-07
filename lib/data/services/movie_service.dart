import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:elemes_app/data/models/movie_detail_model.dart';
import 'package:elemes_app/data/models/movie_model.dart';
import 'package:elemes_app/data/models/movie_upcoming_model.dart';
import 'package:elemes_app/data/models/moview_playingnow_model.dart';
import 'package:elemes_app/data/models/moview_top_model.dart';
import 'package:elemes_app/data/models/search_model.dart';
import 'package:elemes_app/data/models/search_movie_model.dart';
import 'package:elemes_app/presentation/untilities/constant_helpers.dart';
import 'package:elemes_app/presentation/untilities/url_constant.dart';

class MovieService {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: UrlConstant.BASE_URL,
      responseType: ResponseType.json,
      headers: {
        'content-type': ConstantHelper.CONTENT_TYPE,
      },
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
    ),
  );

  Future<MovieTopModel> getMovieTop({int? page}) async {
    try {
      Response response = await dio.get(UrlConstant.GET_MOVIE_TOP,
          queryParameters: {
            "api_key": ConstantHelper.API_KEY,
            "language": "en-US",
            "page": page
          });
      if (response.statusCode != 200) {
        return MovieTopModel();
      }
      return MovieTopModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      return MovieTopModel();
    }
  }

  Future<MovieModel> getMoviePopuler() async {
    try {
      Response response = await dio.get(UrlConstant.GET_MOVIE_POPULER,
          queryParameters: {
            "api_key": ConstantHelper.API_KEY,
            "language": "en-US",
            "page": 1
          });
      if (response.statusCode != 200) {
        return MovieModel();
      }
      return MovieModel.fromJson(response.data);
    } on DioError catch (e) {
      return MovieModel();
    }
  }

  Future<MovieUpcomingModel> getMovieUpComing() async {
    try {
      Response response = await dio.get(UrlConstant.GET_MOVIE_UPCOMING,
          queryParameters: {
            "api_key": ConstantHelper.API_KEY,
            "language": "en-US",
            "page": 1
          });
      if (response.statusCode != 200) {
        return MovieUpcomingModel();
      }
      return MovieUpcomingModel.fromJson(response.data);
    } on DioError catch (e) {
      return MovieUpcomingModel();
    }
  }

  Future<MoviePlayingNowModel> getMovieNowPlaying() async {
    try {
      Response response = await dio.get(UrlConstant.GET_MOVIE_NOWPLAYING,
          queryParameters: {
            "api_key": ConstantHelper.API_KEY,
            "language": "en-US",
            "page": 1
          });
      if (response.statusCode != 200) {
        return MoviePlayingNowModel();
      }
      return MoviePlayingNowModel.fromJson(response.data);
    } on DioError catch (e) {
      return MoviePlayingNowModel();
    }
  }

  Future<MovieDetailModel> getMovieDetail({int? id}) async {
    try {
      Response response = await dio
          .get(UrlConstant.GET_MOVIE_DETAIL + "/${id}", queryParameters: {
        "api_key": ConstantHelper.API_KEY,
        "language": "en-US",
      });
      if (response.statusCode != 200) {
        return MovieDetailModel();
      }
      return MovieDetailModel.fromJson(response.data);
    } on DioError catch (e) {
      return MovieDetailModel();
    }
  }

  Future<SearchMovieModel> getMovieSearch({int? page, String? query}) async {
    try {
      Response response = await dio
          .get(UrlConstant.GET_SEARCH_MOVIE, queryParameters: <String, dynamic>{
        "language": "en-US",
        "page": page!,
        "include_adult": false,
        "api_key": ConstantHelper.API_KEY,
        "query": query!,
      });
      if (response.statusCode != 200) {
        return SearchMovieModel.fromJson(response.data);
      }
      print("movie ${response.data}");
      return SearchMovieModel.fromJson(response.data);
    } on DioError catch (e) {
      print("service ${e.message}");
      return SearchMovieModel();
    }
  }
}
