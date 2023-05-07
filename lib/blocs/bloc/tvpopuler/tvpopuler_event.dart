part of 'tvpopuler_bloc.dart';

abstract class TvpopulerEvent extends Equatable {
  const TvpopulerEvent();

  @override
  List<Object> get props => [];
}

class TvPopulerEvent extends TvpopulerEvent {
  final int? page;

  const TvPopulerEvent({this.page});

  @override
  List<Object> get props => [page!];
}
