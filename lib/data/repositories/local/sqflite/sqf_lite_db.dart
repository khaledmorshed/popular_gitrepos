import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' ;

class SqfLitDb{
  static Database? _database;
  static int dbVersion = 0;
  static String createTableInfo = "";
  static String previousTableInfo = "";
  //_initDb will call every time if we insert, delete, update something in database
  static Future<Database> _initDb({String databaseName = "popular_repo_db"}) async{
   try{
     final rootPath = await getDatabasesPath();
     final dbPath = join(rootPath, databaseName);
     return await openDatabase(dbPath, version: 1, onCreate: _createDb, onUpgrade: _upgradeDb);
   }catch(err){
     throw err;
   }
  }

  //create table for first time
  static Future _createDb(Database db, int version)async{
    await db.execute(createTableInfo);
  }

  //create table during version updating
  static Future<void>  _upgradeDb(Database db, int oldVersion, int newVersion)async{
    if (oldVersion != newVersion) {
      await db.execute(createTableInfo);
    }

  }

  //if you create first table then you will not create another table with build in onCreate function. so you need this _createAnewTableWithoutBuildInFunction function
  static Future<void> _createAnewTableWithoutBuildInFunction(Database db, String table) async {
    await db.execute(table);
  }

  //insert data into table of database without build in function because if you create first table then you can not create table with build in onCreate function.
  static Future<int> insertDataInTableWithoutBuildINFunction({required String tableName, required String createTableInformation, required var map, String databaseName = "popular_repo_db"}) async{
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'popular_repo_db');
    // Check if the database exists
    bool doesDatabaseExist = await databaseExists(path);
    final db = await _initDb(databaseName: databaseName);
    await _createAnewTableWithoutBuildInFunction(db, createTableInformation);
    return db.insert(tableName, map);
  }

  //insert data into table of database with onCreate function which is build in. it is for creating table first time
  static Future<dynamic> createDatabaseAndInsertDataInTable({required String tableName, required String createTableInformation,  var map, String databaseName = "popular_repo_db"}) async{
    try{
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, databaseName);
      // Check if the database exists
      bool doesDatabaseExist = await databaseExists(path);
      if(doesDatabaseExist == false){
        createTableInfo = createTableInformation;
        final db = await _initDb(databaseName: databaseName);
        return db.insert(tableName, map);
      }else{
        final db = await _initDb(databaseName: databaseName);
        await _createAnewTableWithoutBuildInFunction(db, createTableInformation);
        return db.insert(tableName, map);
      }
    }catch(err){
      throw err;
    }
  }

  //get any data from table with passing table name
  static Future<List<Map<String, dynamic>>> getAnyTableDataFromLocalDbWitPassingOnlyTableName({required String tableName, String databaseName = "popular_repo_db"}) async {
    try{
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, databaseName);
      // Check if the database exists
      bool doesDatabaseExist = await databaseExists(path);
      if(doesDatabaseExist == false) return [];
      final db = await _initDb(databaseName: databaseName);
      final result = await db.query(
        tableName,
      );
      return result;
    }catch(err){
      return [];
    }
  }

  //update table value
  static Future<void> updateAnyTableDataFromLocalDb({
    required String tableName,
    required dynamic updateColumnValues,
    required String where,
    required List<dynamic> whereArgs,
    String databaseName = "popular_repo_db"
  }) async {
    try{

      final db = await _initDb(databaseName: databaseName);
      await db.update(
        tableName,
        updateColumnValues,
        where: where,
        whereArgs: whereArgs,
      );
      return;
    }catch(err){
      return;
    }
  }

  //delete any table with direct and with passing value
  static Future<bool> deleteAnyTableDataFromLocalDb({
    required String tableName,
     String? where,
    List<dynamic>? whereArgs,
    bool isTableDataDirectReset = true,
    String databaseName = "popular_repo_db"
  }) async {
    try{
      final db = await _initDb(databaseName: databaseName);
      if (isTableDataDirectReset == false) {
        await db.delete(tableName, where: where, whereArgs: whereArgs);
      } else {
        await db.delete(tableName);
      }
      return true;
    }catch(err){
      return false;
    }
  }

  static Future<void> deleteDatabaseFile({String databaseName = "popular_repo_db"}) async {
    final rootPath = await getDatabasesPath();
    final dbPath = join(rootPath, databaseName);

    // Close any open database connection.
    if (_database != null) {
      await _database?.close();
      _database = null;
    }
    // Delete the database file.
    await deleteDatabase(dbPath);
  }

}