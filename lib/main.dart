import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/business_logic/bloc/weather_bloc.dart';
import 'package:weather_app_bloc/data/repository/weather_repo.dart';
import 'package:weather_app_bloc/presentation/screens/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(
        weatherRepo: WeatherRepo(),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: const Color(0xff7869f3),
            primarySwatch: Colors.purple,),
        home: const SearchPage(),
      ),
    );
  }
}
