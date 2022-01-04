import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weatherapp/repositories/weather_repository.dart';
import 'package:weatherapp/utils/geolocation.dart';

class WeatherController {
  final _repository = WeatherRepository();
  final searchController = TextEditingController();
  final ValueNotifier<HomeState> _state = ValueNotifier(HomeState.loading);

  late Map<String, dynamic> _weather;

  void getWeather() async {
    _state.value = HomeState.loading;

    determinePosition().then((position) async {
      var response = await _repository.getData(position);

      searchController.text = "Localização atual";

      _weather = jsonDecode(response.body);
      _state.value = response.statusCode == 200 ? HomeState.success : HomeState.error;
    }).catchError((e) {
      _weather = {'message': e};
      _state.value = HomeState.error;
    });
  }

  ValueNotifier<HomeState> get state => _state;

  Map<String, dynamic> get weather => _weather;
}

enum HomeState { loading, success, error }
