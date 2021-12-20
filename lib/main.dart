import 'package:assigment/logic/astro/astro_bloc.dart';
import 'package:assigment/logic/astro/filter_astro_cubit.dart';
import 'package:assigment/logic/astro/search_astro_cubit.dart';
import 'package:assigment/logic/observer/app_bloc_observer.dart';
import 'package:assigment/logic/panchang/panchang_cubit.dart';
import 'package:assigment/view/pages/astro/talk_to_astro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => BlocOverrides.runZoned(
      () => runApp(const MyApp()),
      blocObserver: AppBlocObserver(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AstroBloc>(
            create: (context) => AstroBloc(),
          ),
          BlocProvider<SearchAstroCubit>(
            create: (context) => SearchAstroCubit(),
          ),
          BlocProvider<FilterAstroCubit>(
            create: (context) => FilterAstroCubit(),
          ),
          BlocProvider<PanchangCubit>(
            create: (context) => PanchangCubit(),
          ),
        ],
        child: MaterialApp(
            title: 'Astrologer',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.orange,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'Poppins',
            ),
            home: const TalkToAstroPage()));
  }
}

/*
Ravi Kumar
+91 - 8433491441
ravikumar2710999@gmail.com
Portfolio - ravikovind.github.io
GitHub Profile - github.com/ravikovind
*/