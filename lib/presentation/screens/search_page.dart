import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/business_logic/bloc/weather_bloc.dart';
import 'package:weather_app_bloc/presentation/constants/app_string.dart';
import 'package:weather_app_bloc/presentation/constants/colors.dart';
import 'package:weather_app_bloc/presentation/constants/image_assets.dart';
import 'package:weather_app_bloc/presentation/constants/styles.dart';
import 'package:weather_app_bloc/presentation/screens/show_weather.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController? cityController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    cityController = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppString.weatherForecast,
        ),
        actions: [
          IconButton(
            onPressed: () {
              weatherBloc.add(ResetWeather());
              cityController!.clear();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      backgroundColor: ColorManager.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherIsNotSearched) {
                  return weatherNotSearched(weatherBloc);
                } else if (state is WeatherIsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is WeatherIsLoaded) {
                  return ShowWeather(
                      weather: state.getWeather, city: state.city);
                } else {
                  return const Center(
                    child: Text(
                      "City not found",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.white),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Container weatherNotSearched(WeatherBloc weatherBloc) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 40,
      ),
      child: Column(
        children: [
          SizedBox(
              height: 200, width: 200, child: Image.asset(ImageAssets.weather)),
          const SizedBox(
            height: 200,
          ),
         Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: cityController,
            decoration: InputDecoration(
              border: textFormBorder,
              prefixIcon: const Icon(
                Icons.search,
              ),
              labelText: AppString.cityName,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter city name';
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: buttonStyle,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  weatherBloc.add(FetchWeather(city: cityController!.text));
                }
              },
              child: const Text(
                AppString.search,
                style: TextStyle(color: ColorManager.white, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    )
        ],
      ),
    );
  }
}
