part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieStateLoading extends MovieState {}

// ignore: must_be_immutable
class MovieStateLoaded extends MovieState {
  MovieModel moviedata;

  MovieStateLoaded({required this.moviedata});
   @override
  List<Object> get props =>
      [moviedata];
}

class MovieStateError extends MovieState {}





