part of 'movieplayingnow_bloc.dart';

abstract class MovieplayingnowState extends Equatable {
  const MovieplayingnowState();
  
  @override
  List<Object> get props => [];
}

class MovieplayingnowInitial extends MovieplayingnowState {}


class MovieplayingnowLoaded extends MovieplayingnowState {
  MoviePlayingNowModel moviedata;

  MovieplayingnowLoaded({required this.moviedata});
   @override
  List<Object> get props =>
      [moviedata];
}


class MovieplayingnowFailed extends MovieplayingnowState {}