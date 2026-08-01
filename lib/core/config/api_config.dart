/// Central API configuration for the Basma backend.
abstract final class ApiConfig {
  static const String baseUrl = 'https://api.basma-unit.cloud/api';

  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static const Duration connectTimeout = Duration(seconds: 20);
  static const Duration receiveTimeout = Duration(seconds: 20);
}
