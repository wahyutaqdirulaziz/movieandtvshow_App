import 'package:elemes_app/data/models/search_movie_model.dart';
import 'package:elemes_app/data/services/movie_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'searchtvmovie_event.dart';
part 'searchtvmovie_state.dart';

class SearchtvmovieBloc extends Bloc<SearchtvmovieEvent, SearchtvmovieState> {
  SearchtvmovieBloc() : super(SearchtvmovieInitial()) {
    MovieService _movieService = MovieService();

    on<SearchEvent>((event, emit) async {
      emit(SearchtvmovieLoading());
      try {
        print(event.keyword!);
        SearchMovieModel responsem =
            await _movieService.getMovieSearch(page: 1, query: event.keyword!);

        emit(SearchtvmovieLoaded(moviedata: responsem));
      } catch (e) {
        print(e);
        emit(SearchtvmovieError());
      }
    });
  }
}
