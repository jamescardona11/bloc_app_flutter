import 'package:bloc/bloc.dart';
import 'package:blocappflutter/weather/data/model/weather.dart';
import 'package:blocappflutter/weather/data/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(const WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError("Couldn't fetch weather. Is the device online?"));
    }
  }
}
