import 'package:elemes_app/data/models/movie_upcoming_model.dart';
import 'package:elemes_app/data/services/movie_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movieupcoming_event.dart';
part 'movieupcoming_state.dart';

class MovieupcomingBloc extends Bloc<MovieupcomingEvent, MovieupcomingState> {
  MovieupcomingBloc() : super(MovieupcomingInitial()) {
    MovieService _movieService = MovieService();
    on<MovieUpComingEvent>((event, emit) async {
      emit(MovieUpComingStateLoading());
      try {
        MovieUpcomingModel response = await _movieService.getMovieUpComing();
        emit(MovieUpComingStateLoaded(moviedata: response));
      } catch (e) {
        emit(MovieUpComingStateError());
      }
    });
  }
}
