import 'package:dio/dio.dart';
import 'package:ghibliapi/src/services/http/http_client.dart';

class HttpClientImp implements HttpClient {
  final Dio dio;
  HttpClientImp(this.dio);
  @override
  Future<T> get<T>(String path) async {
    final response = await dio.get(path);
    return response.data;
  }
}
