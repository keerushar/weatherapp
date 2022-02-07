import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_bloc/data/models.dart';
import 'package:weather_app_bloc/data/repository/weather_repo.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepo weatherRepo;
  WeatherBloc({required this.weatherRepo}) : super(WeatherIsNotSearched()) {
    on<WeatherEvent>((event, emit) async {
      if (event is FetchWeather) {
        emit(WeatherIsLoading());
        try {
          final weather = await weatherRepo.getWeather(event.city);
          final city = event.city;

          emit(WeatherIsLoaded(weather, city));
        } catch (_) {
          emit(WeatherIsNotLoaded());
        }
      } else if (event is ResetWeather) {
        emit(WeatherIsNotSearched());
      }
    });
  }
}
