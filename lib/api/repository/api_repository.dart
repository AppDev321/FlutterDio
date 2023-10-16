import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_dio/api/api_params.dart';
import 'package:flutter_dio/models/genre_response.dart';
import 'package:flutter_dio/models/movie_response.dart';
import 'package:flutter_dio/models/product_response.dart';
import 'package:flutter_dio/models/res_product.dart';

import '../../data/response/base_response_model.dart';
import '../../models/product_model.dart';
import '../api.dart';
import '../api_end_points.dart';
import '../api_utils.dart';

final title = "ApiRepo";

class ApiRepo {



  Future<ApiResponse?> getProducts() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return ApiResponse.withError( statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
    }
    String url = Api.baseUrl + ApiEndPoints.products;
    try {
      final response = await apiUtils.get(url: url);

      if (response.statusCode == 200) {
        ApiResponse<Product> apiResponse = response.data;
        print(apiResponse);
      } else {
        return ApiResponse.withError(statusCode: CODE_RESPONSE_NULL, msg: "");
      }
    } catch (e) {
      return ApiResponse.withError(
          statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
    }
  }

  Future<MovieResponse?> getPopularMovies() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return MovieResponse.withError(
          statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrlMovies + ApiEndPoints.popularMovies;
    Map<String, dynamic>? queryParameters = {PARAM_API_KEY: Api.api_key};

    try {
      final response =
          await apiUtils.get(url: url, queryParameters: queryParameters);
      return MovieResponse.fromJson(response.data);
    } catch (e) {
      return MovieResponse.withError(
          statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
    }
  }

  Future<MovieResponse?> getUpcomingMovies() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return MovieResponse.withError(
          statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrlMovies + ApiEndPoints.upcomingMovies;
    Map<String, dynamic>? queryParameters = {PARAM_API_KEY: Api.api_key};

    try {
      final response =
          await apiUtils.get(url: url, queryParameters: queryParameters);
      return MovieResponse.fromJson(response.data);
    } catch (e) {
      return MovieResponse.withError(
          statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
    }
  }

  Future<GenreResponse?> getGenreList() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return GenreResponse.withError(
          statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
    }

    String url = Api.baseUrlMovies + ApiEndPoints.getGenreList;
    Map<String, dynamic>? queryParameters = {PARAM_API_KEY: Api.api_key};

    try {
      final response =
          await apiUtils.get(url: url, queryParameters: queryParameters);
      return GenreResponse.fromJson(response.data);
    } catch (e) {
      return GenreResponse.withError(
          statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
    }
  }
}
