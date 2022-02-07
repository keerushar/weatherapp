part of 'weather_bloc.dart';

 class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}
class FetchWeather extends WeatherEvent {
  final String city;
  const FetchWeather({required this.city});

   dynamic get getCity => city;

  @override
  List<Object> get props => [city];
}

class ResetWeather extends WeatherEvent {}
