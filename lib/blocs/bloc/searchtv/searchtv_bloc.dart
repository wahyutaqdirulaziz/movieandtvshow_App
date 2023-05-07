
import 'package:elemes_app/data/models/search_model.dart';
import 'package:elemes_app/data/services/tv_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'searchtv_event.dart';
part 'searchtv_state.dart';

class SearchtvBloc extends Bloc<SearchtvEvent, SearchtvState> {
  SearchtvBloc() : super(SearchtvInitial()) {
    TvService _tvService = TvService();
    on<SearchTvEvent>((event, emit) async {
      emit(SearchtvLoading());
      try {
        print(event.keyword!);
     
        SearchModel responset =
            await _tvService.getTvSearch(page: 1, query: event.keyword!);
        print(responset);
        emit(SearchtvLoaded( tvdata: responset));
      } catch (e) {
        print(e);
        emit(SearchtvError());
      }
    });
  }
}
