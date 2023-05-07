part of 'moviewwatchlist_bloc.dart';

abstract class MoviewwatchlistState extends Equatable {
  const MoviewwatchlistState();
  
  @override
  List<Object> get props => [];
}

class MoviewwatchlistInitial extends MoviewwatchlistState {}

class MoviewwatchlistLoaded extends MoviewwatchlistState {
   var data;

  MoviewwatchlistLoaded({required this.data});
   @override
  List<Object> get props =>
      [data];
}

class MoviewwatchLoaded extends MoviewwatchlistState {
  List<Movie> moviedata;

  MoviewwatchLoaded({required this.moviedata});
   @override
  List<Object> get props =>
      [moviedata];
}

class MoviewwatchlistError extends MoviewwatchlistState {}