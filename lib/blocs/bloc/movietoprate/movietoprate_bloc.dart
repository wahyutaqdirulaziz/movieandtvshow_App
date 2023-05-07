import 'package:elemes_app/data/models/moview_top_model.dart';
import 'package:elemes_app/data/services/movie_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movietoprate_event.dart';
part 'movietoprate_state.dart';

class MovietoprateBloc extends Bloc<MovietoprateEvent, MovietoprateState> {
  MovietoprateBloc() : super(MovietoprateInitial()) {
    MovieService _movieService = MovieService();
    on<MovieTopRateEvent>((event, emit) async {
      emit(MovietoprateInitial());
      try {
        MovieTopModel response =
            await _movieService.getMovieTop(page: event.page);
        emit(MovietoprateLoaded(moviedata: response));
      } catch (e) {
        print(e);
        emit(MovietoprateError());
      }
    });
  }
}
