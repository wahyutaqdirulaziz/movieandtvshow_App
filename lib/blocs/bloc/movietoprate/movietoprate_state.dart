part of 'movietoprate_bloc.dart';

abstract class MovietoprateState extends Equatable {
  const MovietoprateState();
  
  @override
  List<Object> get props => [];
}

class MovietoprateInitial extends MovietoprateState {}

class MovietoprateLoaded extends MovietoprateState {
   MovieTopModel moviedata;

  MovietoprateLoaded({required this.moviedata});
   @override
  List<Object> get props =>
      [moviedata];
}

class MovietoprateError extends MovietoprateState {}