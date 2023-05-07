part of 'tvpopuler_bloc.dart';

abstract class TvpopulerState extends Equatable {
  const TvpopulerState();

  @override
  List<Object> get props => [];
}

class TvpopulerInitial extends TvpopulerState {}

class TvpopulerLoadedState extends TvpopulerState {
  TvPopulerModel tvdata;
  TvTopRateModel tvdatatop;
  TvpopulerLoadedState({required this.tvdata,required this.tvdatatop});
  @override
  List<Object> get props => [tvdata,tvdatatop];
}

class TvpopulerErrorState extends TvpopulerState {}
