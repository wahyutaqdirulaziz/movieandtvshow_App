
import 'package:elemes_app/data/models/movie_detail_model.dart';
import 'package:elemes_app/data/services/movie_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    MovieService _movieService = MovieService();
     on<MovieDetailEvent>((event, emit) async {
      emit(MovieDetailStateLoading());
      try {
        MovieDetailModel response = await _movieService.getMovieDetail(id: event.id);
        emit(MovieDetailStateLoaded(data: response));
      } catch (e) {
        emit(MovieDetailStateError());
      }
    });
  }
}
