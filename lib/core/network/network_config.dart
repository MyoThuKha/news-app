class NetworkConfig {
  const NetworkConfig._();

  static const String baseUrl = 'https://newsapi.org/v2';
  static const int connectTimeout = 10000;
  static const int receiveTimeout = 10000;
  static const int sendTimeout = 10000;

  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}
