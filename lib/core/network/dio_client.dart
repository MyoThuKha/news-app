import 'package:dio/dio.dart';
import 'package:news/core/constants/api_consts.dart';

class DioClient {

  DioClient(Dio dio) : _dio = dio {
    _setupInterceptors(ApiConstants.apiKey);
  }

  late final Dio _dio;
  Dio get dio => _dio;

  void _setupInterceptors(String? apiKey) {

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (apiKey != null) {
            options.queryParameters['apiKey'] = apiKey;
          }
          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (error, handler) {
          final errorMessage = _handleError(error);

          handler.next(
            DioException(
              requestOptions: error.requestOptions,
              message: errorMessage,
              type: error.type,
              response: error.response,
            ),
          );
        },
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
        error: true,
      ),
    );
  }

  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please try again.';
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        switch (statusCode) {
          case 400:
            return 'Bad request. Please check your parameters.';
          case 401:
            return 'Unauthorized. Please check your API key.';
          case 403:
            return 'Forbidden. You don\'t have permission to access this resource.';
          case 404:
            return 'Not found. The requested resource was not found.';
          case 500:
            return 'Internal server error. Please try again later.';
          default:
            return 'Server error: $statusCode';
        }
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.connectionError:
        return 'No internet connection. Please check your network.';
      case DioExceptionType.unknown:
        return 'An unexpected error occurred: ${error.message}';
      default:
        return 'An error occurred: ${error.message}';
    }
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
