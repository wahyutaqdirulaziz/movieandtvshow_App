part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();
  
  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}


class MovieDetailStateLoading extends DetailState {}

// ignore: must_be_immutable
class MovieDetailStateLoaded extends DetailState {
  MovieDetailModel data;

  MovieDetailStateLoaded({required this.data});
   @override
  List<Object> get props =>
      [data];
}

class MovieDetailStateError extends DetailState {}

