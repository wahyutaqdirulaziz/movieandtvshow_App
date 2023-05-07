part of 'searchtv_bloc.dart';

abstract class SearchtvState extends Equatable {
  const SearchtvState();
  
  @override
  List<Object> get props => [];
}

class SearchtvInitial extends SearchtvState {}

class SearchtvLoading extends SearchtvState {}
// ignore: must_be_immutable
class SearchtvLoaded extends SearchtvState {
  SearchModel? tvdata;

  SearchtvLoaded({ required this.tvdata});
  @override
  List<Object> get props => [tvdata!];
}

class SearchtvError extends SearchtvState {}