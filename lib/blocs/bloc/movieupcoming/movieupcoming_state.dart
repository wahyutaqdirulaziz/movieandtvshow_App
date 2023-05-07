part of 'movieupcoming_bloc.dart';

abstract class MovieupcomingState extends Equatable {
  const MovieupcomingState();
  
  @override
  List<Object> get props => [];
}

class MovieupcomingInitial extends MovieupcomingState {}




class MovieUpComingStateLoading extends MovieupcomingState {}

class MovieUpComingStateLoaded extends MovieupcomingState {
  MovieUpcomingModel moviedata;

  MovieUpComingStateLoaded({required this.moviedata});
   @override
  List<Object> get props =>
      [moviedata];
}

class MovieUpComingStateError extends MovieupcomingState {}