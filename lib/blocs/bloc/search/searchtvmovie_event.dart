part of 'searchtvmovie_bloc.dart';

abstract class SearchtvmovieEvent extends Equatable {
  const SearchtvmovieEvent();

  @override
  List<Object> get props => [];
}

class SearchEvent extends SearchtvmovieEvent {
  final int? page;
  final String? keyword;

  const SearchEvent({this.page, this.keyword});

  @override
  List<Object> get props => [page!, keyword!];
}
