import 'package:elemes_app/data/models/movie.dart';
import 'package:elemes_app/data/services/watchlist_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'moviewwatchlist_event.dart';
part 'moviewwatchlist_state.dart';

class MoviewwatchlistBloc
    extends Bloc<MoviewwatchlistEvent, MoviewwatchlistState> {
  MoviewwatchlistBloc() : super(MoviewwatchlistInitial()) {
    final movieRepo = MovieRepo();
    on<MovieInsertEvent>((event, emit) async {
      // TODO: implement event handler
      emit(MoviewwatchlistInitial());
      try {
        List<Movie> data = await movieRepo.getallMoview();
        var contain =
            data.where((element) => element.id_movie == event.movie!.id_movie);
        if (contain.isEmpty) {
          await movieRepo.insertMovie(event.movie!);
          emit(MoviewwatchlistLoaded(data: 1));
        } else {
          emit(MoviewwatchlistError());
        }
      } catch (e) {
        print(e);
        emit(MoviewwatchlistError());
      }
    });

    on<MovieWatchEvent>((event, emit) async {
      // TODO: implement event handler
      emit(MoviewwatchlistInitial());
      try {
        if (event.isDeleted!) {
          List<Movie> data = await movieRepo.deleteMoview(event.id!);
          emit(MoviewwatchLoaded(moviedata: data));
          print("berhasil");
        } else {
          List<Movie> data = await movieRepo.getallMoview();
          if (data.isEmpty) {
            print("aduhh gagal");
            emit(MoviewwatchLoaded(moviedata: data));
          } else {
            emit(MoviewwatchLoaded(moviedata: data));
            print("berhasil");
          }
        }
      } catch (e) {
        print("aduhh gagal");
        emit(MoviewwatchlistError());
      }
    });
  }
}
