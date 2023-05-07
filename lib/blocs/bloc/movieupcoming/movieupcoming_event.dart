part of 'movieupcoming_bloc.dart';

abstract class MovieupcomingEvent extends Equatable {
  const MovieupcomingEvent();

  @override
  List<Object> get props => [];
}
class MovieUpComingEvent extends MovieupcomingEvent {
   final String? page;

  const MovieUpComingEvent({this.page});

  @override
  List<Object> get props => [];
}