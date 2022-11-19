import 'package:ghibliapi/src/models/ghibli_model.dart';

abstract class GetServiceGhibli {
  Future<List<GhibliModel>> getAll();
}
