import 'package:dio/dio.dart';
import 'package:elemes_app/data/models/search_model.dart';

import 'package:elemes_app/data/models/tv_populer_model.dart';
import 'package:elemes_app/data/models/tv_top_model.dart';
import 'package:elemes_app/presentation/untilities/constant_helpers.dart';
import 'package:elemes_app/presentation/untilities/url_constant.dart';

class TvService {
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

  Future<TvPopulerModel> getTvpopuler({int? page}) async {
    try {
      Response response = await dio.get(UrlConstant.GET_TV_POPULER,
          queryParameters: {
            "api_key": ConstantHelper.API_KEY,
            "language": "en-US",
            "page": page
          });
      if (response.statusCode != 200) {
        return TvPopulerModel();
      }
      return TvPopulerModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      return TvPopulerModel();
    }
  }

  Future<TvTopRateModel> getTopTvrate({int? page}) async {
    try {
      Response response = await dio.get(UrlConstant.GET_TV_TOP,
          queryParameters: {
            "api_key": ConstantHelper.API_KEY,
            "language": "en-US",
            "page": page
          });
      if (response.statusCode != 200) {
        return TvTopRateModel();
      }
      return TvTopRateModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      return TvTopRateModel();
    }
  }

  Future<SearchModel> getTvSearch({int? page, String? query}) async {
    try {
      Response response = await dio
          .get(UrlConstant.GET_SEARCH_TV, queryParameters: <String, dynamic>{
        "api_key": ConstantHelper.API_KEY,
        "language": "en-US",
        "include_adult": false,
        "query": query!,
        "page": page!
      });
      if (response.statusCode != 200) {
        return SearchModel();
      }
      print(response.data);
      return SearchModel.fromJson(response.data);
    } on DioError catch (e) {
      print("service ${e.message}");
      return SearchModel();
    }
  }
}
