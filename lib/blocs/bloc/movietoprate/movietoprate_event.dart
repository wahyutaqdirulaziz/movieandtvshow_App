part of 'movietoprate_bloc.dart';

abstract class MovietoprateEvent extends Equatable {
  const MovietoprateEvent();

  @override
  List<Object> get props => [];
}

class MovieTopRateEvent extends MovietoprateEvent {
  final int? page;

  const MovieTopRateEvent({this.page});

  @override
  List<Object> get props => [page!];
}
