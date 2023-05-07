import 'package:elemes_app/data/models/movie_detail_model.dart';
import 'package:elemes_app/data/models/movie_model.dart';
import 'package:elemes_app/data/services/movie_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieService _movieService = MovieService();
  MovieBloc() : super(MovieInitial()) {
    on<MoviePopulerEvent>((event, emit) async {
      emit(MovieStateLoading());
      try {
        MovieModel response = await _movieService.getMoviePopuler();
        emit(MovieStateLoaded(moviedata: response));
      } catch (e) {
        emit(MovieStateError());
      }
    });

    
  }
}
