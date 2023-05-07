

import 'package:elemes_app/data/database/databaseHelper.dart';
import 'package:elemes_app/data/models/movie.dart';

class MovieRepo{

  final movieDatabase = DatabaseHelper();

  Future <List<Movie>> getallMoview() =>movieDatabase.getMovieList();

  Future insertMovie(Movie movie) => movieDatabase.insertMovie(movie);

  Future deleteMoview(int id) => movieDatabase.deleteNote(id);


}