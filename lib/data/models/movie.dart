class Movie {
  int? _id;
  String? poster_path;
  String? id_movie;

  Movie({this.poster_path, this.id_movie});

  Movie.withId(this._id, this.poster_path, this.id_movie);

  // int get id => _id!;

  // String get poster_path => _poster_path!;

  // String get id_movie => _id_movie!;
  // set poster_path(String value) {
  //   this._poster_path = value;
  // }

  // set id_movie(String value) {
  //   this._id_movie = value;
  // }

  //convert Note Object into Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = _id;
    map['poster_path'] = poster_path;
    map['id_movie'] = id_movie;
    return map;
  }

  //Extract Note object from the map object
  Movie.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this.poster_path = map['poster_path'];
    this.id_movie = map['id_movie'];
  }
}
