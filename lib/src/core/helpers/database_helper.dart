import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  // construtor com acesso privado
  DB._();
  // criar uma instancia do DB
  static final DB instance = DB._();

  // instanciando o sqlite
  static Database? _database;

  // verficicando se ja existe a database se nao inicia uma nova
  get database async {
    if (_database != null) return _database;

    return await _initDatase();
  }

  Future<Database> _initDatase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'ghibliDB.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      ''' 
        CREATE TABLE ghibli(
            id TEXT,
           title TEXT,
           original_title TEXT,
           image TEXT,
           movie_banner TEXT,
           description TEXT,
           director TEXT,
           producer TEXT,
           release_date TEXT
        );
      ''',
    );
  }
}
