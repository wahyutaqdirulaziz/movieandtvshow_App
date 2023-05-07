part of 'moviewwatchlist_bloc.dart';

abstract class MoviewwatchlistEvent extends Equatable {
  const MoviewwatchlistEvent();

  @override
  List<Object> get props => [];
}

class MovieInsertEvent extends MoviewwatchlistEvent {
  final Movie? movie;

  const MovieInsertEvent({this.movie});

  @override
  List<Object> get props => [movie!];
}

class MovieWatchEvent extends MoviewwatchlistEvent {
  final List<Movie>? movie;
  bool? isDeleted;
  int? id;

  MovieWatchEvent({this.movie, this.isDeleted,this.id});

  @override
  List<Object> get props => [movie!, isDeleted!];
}
