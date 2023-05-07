part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}


class MovieDetailEvent extends DetailEvent {
   final int? id;

  const MovieDetailEvent({this.id});

  @override
  List<Object> get props => [];
}