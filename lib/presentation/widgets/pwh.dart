import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/business_logic/bloc/weather_bloc.dart';
import 'package:weather_app_bloc/presentation/constants/app_string.dart';
import 'package:weather_app_bloc/presentation/constants/image_assets.dart';
import 'package:weather_app_bloc/presentation/widgets/column_data_widget.dart';

class PwhWidget extends StatelessWidget {
  const PwhWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherIsLoaded) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ColumnDataWidget(
                      title: AppString.pressure,
                      imageFile: ImageAssets.pressure,
                      data: "${state.getWeather.pressure.toString()} hPA",
                    ),
                    ColumnDataWidget(
                      title: AppString.wind,
                      imageFile: ImageAssets.wind,
                      data: "${state.getWeather.wind.toString()} m/s",
                    ),
                    ColumnDataWidget(
                      title: AppString.humidity,
                      imageFile: ImageAssets.humidity,
                      data: "${state.getWeather.humidity.toString()}%",
                    ),
                    ColumnDataWidget(
                      title: AppString.feelLike,
                      imageFile: ImageAssets.feelsLike,
                      data: "${state.getWeather.getFeelLike.round().toString()}°C",
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
