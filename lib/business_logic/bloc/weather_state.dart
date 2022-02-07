part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final dynamic _weather;
  final dynamic city;

  const WeatherIsLoaded(this._weather, this.city);

  WeatherModel get getWeather => _weather;

  @override
  List<Object> get props => [_weather,city];
}

class WeatherIsNotLoaded extends WeatherState {}
