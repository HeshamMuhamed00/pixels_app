import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://api.pexels.com/v1/';
  final _apiKey = 'CpDsPHZscLRlaU57g0l5IYRrZRzSTNJlbNS5dBCIDONu0afkPtQGlBTt';
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options.headers['Authorization'] = _apiKey;
  }

  Future<List<dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');

    // Assuming response.data['photos'] is the correct path to the list
    return response.data['photos'] as List<dynamic>;
  }
}
