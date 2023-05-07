part of 'movieplayingnow_bloc.dart';

abstract class MovieplayingnowEvent extends Equatable {
  const MovieplayingnowEvent();

  @override
  List<Object> get props => [];
}

class MoviePlayingnowEvent extends MovieplayingnowEvent {
   final String? page;

  const MoviePlayingnowEvent({this.page});

  @override
  List<Object> get props => [];
}