import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_bloc/data/models.dart';
import 'package:weather_app_bloc/presentation/constants/colors.dart';
import 'package:weather_app_bloc/presentation/widgets/pwh.dart';

class ShowWeather extends StatelessWidget {
  final WeatherModel? weather;
  final String? city;
  const ShowWeather({Key? key, required this.weather, this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  DateFormat("yMMMMd").format(DateTime.now()),
                  style: const TextStyle(
                    fontSize: 18,
                    color: ColorManager.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_sharp,
                      color: ColorManager.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      city!,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.white),
                    ),
                  ],
                ),
                getWeatherIcon(weather!.icon),
                Text(
                  weather!.desc.toString(),
                  style: const TextStyle(
                    fontSize: 25,
                    color: ColorManager.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${weather!.getTemp.round()}°",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorManager.white,
                    fontSize: 100,
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
              ],
            ),
          ),
        ),
        const PwhWidget(),
      ],
    );
  }

  Image getWeatherIcon(String _icon) {
    String path = 'assets/icons/';
    String imageExtension = ".png";
    return Image.asset(
      path + _icon + imageExtension,
      width: 250,
      height: 250,
    );
  }
}
