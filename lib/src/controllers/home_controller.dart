import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ghibliapi/src/models/ghibli_model.dart';
import 'package:ghibliapi/src/services/get_services_ghibli/get_service_ghibli_imp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../core/helpers/database_helper.dart';

class HomeController extends ChangeNotifier {
  GetServiceGhibliImp imp;
  HomeController(this.imp) {
    getAllMovies();
    getAllMovieOff();
  }

  late Database db;
  final controllerSearch = TextEditingController();
  final listValeu = ValueNotifier(<GhibliModel>[]);
  bool isLoading = false;
  final searchTap = ValueNotifier(false);

  Future<List<GhibliModel>> getAllMovieOff() async {
    db = await DB.instance.database;
    var aliement = await db.query('ghibli', orderBy: 'id');
    listValeu.value = aliement.isNotEmpty
        ? aliement.map((model) => GhibliModel.fromMap(model)).toList()
        : [];
    notifyListeners();
    return listValeu.value;
  }

  Future<int> add(GhibliModel model) async {
    db = await DB.instance.database;
    var add = await db.insert('ghibli', model.toMap());
    notifyListeners();
    return add;
  }

  Future<void> getAllMovies() async {
    final listaOff = await getAllMovieOff();
    isLoading = true;
    try {
      final list = await imp.getAll();
      listValeu.value = list;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      listValeu.value = listaOff;
      notifyListeners();
    }
  }

  void saveRequest() {
    final lista = listValeu.value;
    lista.forEach((element) {
      add(element);
    });
  }

  togleSearch() {
    if (searchTap.value == true) {
      searchTap.value = false;
    } else if (searchTap.value == false) {
      searchTap.value = true;
    } else {
      searchTap.value = false;
    }
    controllerSearch.clear();
    getAllMovies();
    notifyListeners();
  }

  void searchFilms(String queryInput) {
    if (queryInput.isNotEmpty) {
      final listaQuery = listValeu.value.where((model) {
        final title = model.title!.toLowerCase();
        final input = queryInput.toString().toLowerCase();
        return title.contains(input);
      }).toList();
      listValeu.value = listaQuery;
      notifyListeners();
    } else {
      getAllMovies();
    }
  }
}
