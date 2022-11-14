import 'package:country_list_app/core/constants/colors.dart';
import 'package:country_list_app/features/screens/my_country_home_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'data/repository/country_repo.dart';
import 'logic/bloc/bloc/country_bloc.dart';
import 'logic/bloc/bloc_observer.dart';
import 'logic/cubit/filter_group_cubit/fiter_group_cubit.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: CountryBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<CountryRepository>(
        create: (context) => CountryRepository(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<CountryBloc>(
              create: (context) => CountryBloc(
                countryRepository:
                    RepositoryProvider.of<CountryRepository>(context),
              ),
            ),
            BlocProvider<FilterGroupCubit>(
              create: (context) => FilterGroupCubit(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData.dark(),
            theme: ThemeData(
              // brightness: Brightness.dark,
              visualDensity:
                  const VisualDensity(horizontal: 2.0, vertical: 2.0),
              primaryColorLight: backgroundColorwt,
              primaryColorDark: backgroundColordark,
            ),
            home: const HomeScreen(),
          ),
        ));
  }
}
