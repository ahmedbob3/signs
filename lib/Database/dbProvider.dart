import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  int databaseVersion = 1 ;

  static final DBProvider db = DBProvider._();
  Database _database;
  static bool isFirstTime ;



  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  static  fetchDataBasePath() async {
    String dbName = "signs.db";
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);
    return path;
  }

  Future<Database> initDB() async {

    String _p = await fetchDataBasePath();checkFirstInstall(_p);
   // return  openDatabase(_p, version: databaseVersion, onCreate: createTables );
  }

  Future<bool> databaseExists(String path) => databaseFactory.databaseExists(path);

  Future<bool> deleteDatabase(String path) => databaseFactory.deleteDatabase(path);

  checkFirstInstall(String path) async {
    var isDBExist = await databaseExists(path);
    print('Yes db is existed == > $isDBExist');
    if ((isDBExist ?? false) && (isFirstTime ?? false)) {
        deleteDatabase(path);
    }
  }

    Future createTables(Database db, String tableName,String tableProperties,int version) async {
      print("Attempt  to create db " + DateTime.now().toString());
      await db.execute(''' CREATE TABLE IF NOT EXISTS $tableName ( $tableProperties)''');
      isFirstTime = true;
      print("db created " + DateTime.now().toString());
    }
  }



