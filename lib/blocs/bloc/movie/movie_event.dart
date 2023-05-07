part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}


class MoviePopulerEvent extends MovieEvent {
   final String? page;

  const MoviePopulerEvent({this.page});

  @override
  List<Object> get props => [];
}


