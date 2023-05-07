import 'package:elemes_app/data/models/moview_playingnow_model.dart';
import 'package:elemes_app/data/services/movie_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movieplayingnow_event.dart';
part 'movieplayingnow_state.dart';

class MovieplayingnowBloc
    extends Bloc<MovieplayingnowEvent, MovieplayingnowState> {
  MovieService _movieService = MovieService();
  MovieplayingnowBloc() : super(MovieplayingnowInitial()) {
    on<MovieplayingnowEvent>((event, emit) async {
      emit(MovieplayingnowInitial());
      try {
        MoviePlayingNowModel response =
            await _movieService.getMovieNowPlaying();
        emit(MovieplayingnowLoaded(moviedata: response));
      } catch (e) {
        emit(MovieplayingnowFailed());
      }
    });
  }
}
