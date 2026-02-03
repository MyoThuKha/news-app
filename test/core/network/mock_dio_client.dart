import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:news/core/network/dio_client.dart';

class MockDioClient extends Mock implements DioClient {

  MockDioClient() {
    // Load response.json data
    final json = jsonDecode(File('test/data/response.json').readAsStringSync());
    responseJson = json as Map<String, dynamic>;
  }

  late Map<String, dynamic> responseJson;

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return Response<Map<String, dynamic>>(
          data: responseJson,
          statusCode: 200,
          requestOptions: RequestOptions(path: path),
        )
        as Response<T>;
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return Response<Map<String, dynamic>>(
          data: responseJson,
          statusCode: 200,
          requestOptions: RequestOptions(path: path),
        )
        as Response<T>;
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return Response<Map<String, dynamic>>(
          data: responseJson,
          statusCode: 200,
          requestOptions: RequestOptions(path: path),
        )
        as Response<T>;
  }

  @override
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return Response<Map<String, dynamic>>(
          data: responseJson,
          statusCode: 200,
          requestOptions: RequestOptions(path: path),
        )
        as Response<T>;
  }
}
