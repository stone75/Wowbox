import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wowbox/C.dart';
import 'package:wowbox/models/mdlUserInfo.dart';

class DBHelper {
  final String databasename = 'wowbox.db';
  final String tablename = 'userinfo';

  Future<Database> _initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databasename);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $tablename ('
            'channelname TEXT,'
            'userid TEXT PRIMARY KEY,'
            'nick TEXT,'
            'profile TEXT,'
            'thumbnail TEXT'
          ')',
        );
      },
    );
  }

  Future<void> insertPetInfo(ModelUserInfo userinfo) async {
    final Database database = await _initDB();
    await database.insert(tablename, userinfo.toMap());
  }

  // Future<ModelUserInfo> getUserInfo() async {
  Future<int> getUserInfo() async {
    final Database database = await _initDB();
    var maps = await database.query(tablename);

    // final List<Map<String, dynamic>> maps = await database.query(tablename);

    if (maps.isNotEmpty) {
      C.g_UserInfo = ModelUserInfo.fromJson(maps[0]);
      return 0;
    } else {
      return 1;
    }
  }

  Future<int> updateScore(ModelUserInfo userinfo) async {
    int rval = 0;
    final Database database = await _initDB();

    rval = await database.update(
      tablename,
      userinfo.toMap(),
      where: "userid = ?",
      whereArgs: [userinfo.userid],
    );

    return rval;
  }

  Future<int> upsertScore(ModelUserInfo info) async {
    int rval = 0;

    rval = await updateScore(info) ;
    if (rval == 0) {
      insertPetInfo(info);
      rval = 1;
    }

    return rval;
  }

}