import 'package:elemes_app/presentation/routes/route_generate.dart';
import 'package:elemes_app/presentation/untilities/bloc_cubit_observer.dart';
import 'package:elemes_app/presentation/untilities/color_constant.dart';
import 'package:elemes_app/presentation/untilities/multi_bloc_providers_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocCubitObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MultiBlocProviderList.providers(),
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: child!,
          );
        },
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        title: 'Elemes',
        theme: ThemeData(
          colorScheme: const ColorScheme.light()
              .copyWith(primary: ColorConstant.kOrangeColor),
        ),
      ),
    );
  }
}
