part of 'searchtvmovie_bloc.dart';

abstract class SearchtvmovieState extends Equatable {
  const SearchtvmovieState();

  @override
  List<Object> get props => [];
}

class SearchtvmovieInitial extends SearchtvmovieState {}

class SearchtvmovieLoading extends SearchtvmovieState {}

// ignore: must_be_immutable
class SearchtvmovieLoaded extends SearchtvmovieState {
  SearchMovieModel? moviedata;


  SearchtvmovieLoaded({required this.moviedata});
  @override
  List<Object> get props => [moviedata!];
}

class SearchtvmovieError extends SearchtvmovieState {}
