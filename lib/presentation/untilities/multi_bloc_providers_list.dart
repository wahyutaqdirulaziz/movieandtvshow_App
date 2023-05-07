import 'package:elemes_app/blocs/bloc/detail/detail_bloc.dart';
import 'package:elemes_app/blocs/bloc/movie/movie_bloc.dart';
import 'package:elemes_app/blocs/bloc/movieplayingnow/movieplayingnow_bloc.dart';
import 'package:elemes_app/blocs/bloc/movietoprate/movietoprate_bloc.dart';
import 'package:elemes_app/blocs/bloc/movieupcoming/movieupcoming_bloc.dart';
import 'package:elemes_app/blocs/bloc/moviewatchlist/moviewwatchlist_bloc.dart';
import 'package:elemes_app/blocs/bloc/search/searchtvmovie_bloc.dart';
import 'package:elemes_app/blocs/bloc/searchtv/searchtv_bloc.dart';
import 'package:elemes_app/blocs/bloc/tvpopuler/tvpopuler_bloc.dart';
import 'package:elemes_app/blocs/cubit/splash/splash_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocProviderList {
  static List<BlocProvider> providers() {
    return <BlocProvider>[
      BlocProvider<SplashCubit>(
        create: (context) => SplashCubit(),
      ),
      BlocProvider<MovieBloc>(
        create: (context) => MovieBloc(),
      ),
      BlocProvider<MovieupcomingBloc>(
        create: (context) => MovieupcomingBloc(),
      ),
      BlocProvider<MovieplayingnowBloc>(
        create: (context) => MovieplayingnowBloc(),
      ),
      BlocProvider<MovietoprateBloc>(
        create: (context) => MovietoprateBloc(),
      ),
      BlocProvider<DetailBloc>(
        create: (context) => DetailBloc(),
      ),
      BlocProvider<MoviewwatchlistBloc>(
          create: (context) => MoviewwatchlistBloc()),
      BlocProvider<TvpopulerBloc>(create: (context) => TvpopulerBloc()),
      BlocProvider<SearchtvmovieBloc>(create: (context) => SearchtvmovieBloc()),

      BlocProvider<SearchtvBloc>(create: (context) => SearchtvBloc()),
    ];
  }
}
