part of 'searchtv_bloc.dart';

abstract class SearchtvEvent extends Equatable {
  const SearchtvEvent();

  @override
  List<Object> get props => [];
}

class SearchTvEvent extends SearchtvEvent {
  final int? page;
  final String? keyword;

  const SearchTvEvent({this.page, this.keyword});

  @override
  List<Object> get props => [page!, keyword!];
}