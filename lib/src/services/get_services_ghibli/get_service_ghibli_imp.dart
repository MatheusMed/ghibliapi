import 'package:ghibliapi/src/core/utils.dart';
import 'package:ghibliapi/src/models/ghibli_model.dart';
import 'package:ghibliapi/src/services/get_services_ghibli/get_service_ghibli.dart';
import 'package:ghibliapi/src/services/http/http_client.dart';

class GetServiceGhibliImp implements GetServiceGhibli {
  final HttpClient httpClient;
  GetServiceGhibliImp(this.httpClient);
  @override
  Future<List<GhibliModel>> getAll() async {
    try {
      final response = await httpClient.get(urlPath);
      final result =
          (response as List).map((e) => GhibliModel.fromMap(e)).toList();
      return result;
    } catch (e) {
      throw Exception("error $e");
    }
  }
}
