import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dio/api/api_params.dart';
import 'package:flutter_dio/models/genre_response.dart';
import 'package:flutter_dio/models/movie_response.dart';
import 'package:flutter_dio/models/res_product.dart';

import '../../data/response/base_response_model.dart';
import '../../models/add_product_model.dart';
import '../../models/res_dispatch.dart';
import '../api.dart';
import '../api_end_points.dart';
import '../api_utils.dart';

class ApiRepo {
  Future<ApiResponse?> getProducts() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return ApiResponse.withError(
          statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
    }
    String url = Api.baseUrl + ApiEndPoints.products;
    try {
      final response = await apiUtils.get(url: url);

      if (response.statusCode == 200) {
        if (response.data is List) {
          List<Product> productList = (response.data as List)
              .map((item) => Product.fromJson(item))
              .toList();
          ApiResponse<List<Product>> apiResponse =
              ApiResponse(status: 200, message: "Success", data: productList);
          return apiResponse;
        } else {
          return ApiResponse.withError(
              statusCode: CODE_RESPONSE_NULL, msg: "Data is not a list");
        }
      } else {
        return ApiResponse.withError(statusCode: CODE_RESPONSE_NULL, msg: "");
      }
    } catch (e) {
      return ApiResponse.withError(
          statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
    }
  }


  Future<ApiResponse?> getDispatch() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return ApiResponse.withError(
          statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
    }
    String url = Api.baseUrl + ApiEndPoints.dispatch;
    try {
      final response = await apiUtils.get(url: url);

      if (response.statusCode == 200) {
        if (response.data is List) {
          List<Dispatch> dispatchList = (response.data as List)
              .map((item) => Dispatch.fromJson(item))
              .toList();
          ApiResponse<List<Dispatch>> apiResponse =
          ApiResponse(status: 200, message: "Success", data: dispatchList);
          return apiResponse;
        } else {
          return ApiResponse.withError(
              statusCode: CODE_RESPONSE_NULL, msg: "Data is not a list");
        }
      } else {
        return ApiResponse.withError(statusCode: CODE_RESPONSE_NULL, msg: "");
      }
    } catch (e) {
      return ApiResponse.withError(
          statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
    }
  }





  Future<ApiResponse?> addNewProduct(AddProduct product) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return ApiResponse.withError(
          statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
    }
    String url = Api.baseUrl + ApiEndPoints.products;
    try {
      final response = await apiUtils.post(url: url,data: product,options:  Options(headers: apiUtils.header));

      if (response.statusCode == 200) {
          ApiResponse<List<Product>> apiResponse = ApiResponse(status: 200, message: "Success", data: []);
          return apiResponse;
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
