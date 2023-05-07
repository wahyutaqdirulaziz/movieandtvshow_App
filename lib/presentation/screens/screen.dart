import 'dart:async';
import 'dart:io';

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
import 'package:elemes_app/data/models/movie.dart';
import 'package:elemes_app/data/models/search_model.dart';
import 'package:elemes_app/presentation/routes/route_name.dart';
import 'package:elemes_app/presentation/untilities/color_constant.dart';
import 'package:elemes_app/presentation/untilities/constant_helpers.dart';
import 'package:elemes_app/presentation/untilities/dbouncer.dart';

import 'package:elemes_app/presentation/untilities/textstyle.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

part './home_screen.dart';
part 'splash_screen.dart';
part 'app_screen.dart';
part 'watch_list_screen.dart';
part 'search_screen.dart';
part 'list_screen.dart';
part 'detail_screen.dart';
part 'detail_watching_screen.dart';
