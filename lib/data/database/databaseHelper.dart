import 'package:elemes_app/data/models/movie.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String movie_table = 'movie_table';
  String id = 'id';
  String id_movie = 'id_movie';
  String poster_path = 'poster_path';

  DatabaseHelper.createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper.createInstance();
    }
    return _databaseHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database!;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();

    String path = directory.path + 'movie_table.db';

    var birthdayDatabase =
        await openDatabase(path, version: 1, onCreate: _createDB);
    return birthdayDatabase;
  }

  void _createDB(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $movie_table($id INTEGER PRIMARY KEY AUTOINCREMENT, $poster_path TEXT, $id_movie TEXT)');
  }

  //Fetch operation: get all note objects from database
  Future<List<Map<String, dynamic>>> getMovieMapList() async {
    Database db = await this.database; //call database
    var result = db.query(movie_table, orderBy: '$id DESC'); // get data
    return result;
  }

  //Insert operation : Insert a aNote Object and save it to database
  Future<int> insertMovie(
    Movie movie,
  ) async {
    String id_m = movie.id_movie!;
    Database db = await this.database; //call database
    // await db.rawDelete('DELETE FROM $movie_table WHERE $id= $movie.id_movie');
    var result = await db.insert(movie_table, movie.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
    return result;
  }

  Future<int> deleteNote(int id1) async {
    Database db = await this.database;
    var result =
        await db.rawDelete('DELETE FROM $movie_table WHERE $id_movie= $id1');
    return result;
  }

  // Future<int> moviecek(int id1) async {
  //   Database db = await this.database;
  //   var result = await db.rawDelete('DELETE FROM $movie_table WHERE $id= $id1');
  //   return result;
  // }
  //get the 'Map List' and convert it to note list

  Future<List<Movie>> getMovieList() async {
    var movieMapList = await getMovieMapList();
    int count = movieMapList.length;
    List<Movie> movieList = [];
    //for loop to create a 'Note List' from 'Map List'
    for (int i = 0; i < count; i++) {
      movieList.add(Movie.fromMapObject(movieMapList[i]));
    }

    return movieList;
  }
}
