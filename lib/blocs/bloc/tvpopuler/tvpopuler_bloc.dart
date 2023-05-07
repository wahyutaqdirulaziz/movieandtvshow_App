import 'package:elemes_app/data/models/tv_populer_model.dart';
import 'package:elemes_app/data/models/tv_top_model.dart';
import 'package:elemes_app/data/services/tv_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tvpopuler_event.dart';
part 'tvpopuler_state.dart';

class TvpopulerBloc extends Bloc<TvpopulerEvent, TvpopulerState> {
  TvpopulerBloc() : super(TvpopulerInitial()) {
    TvService _tvService = TvService();
    on<TvPopulerEvent>((event, emit) async {
      emit(TvpopulerInitial());

      try {
        TvPopulerModel tvdata = await _tvService.getTvpopuler(page: 1);
        TvTopRateModel tvdatatop = await _tvService.getTopTvrate(page: 1);

        emit(TvpopulerLoadedState(tvdata: tvdata, tvdatatop: tvdatatop));
      } catch (e) {
        emit(TvpopulerErrorState());
      }
    });
  }
}
