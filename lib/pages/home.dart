import 'package:flutter/material.dart';
import 'package:weatherapp/components/current_weather.dart';
import 'package:weatherapp/components/daily.dart';
import 'package:weatherapp/components/error.dart';
import 'package:weatherapp/components/gradient.dart';
import 'package:weatherapp/components/loading.dart';
import 'package:weatherapp/components/search_bar.dart';
import 'package:weatherapp/controllers/weather_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = "/";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherController _controller = WeatherController();

  @override
  void initState() {
    super.initState();
    _controller.getWeather();
  }

  Widget _stateBuilder(HomeState state) {
    switch (state) {
      case HomeState.loading:
        return const Loading();

      case HomeState.error:
        return Error(
          message: _controller.errorDetail.message,
          callback: _controller.getWeather,
        );

      case HomeState.success:
        return Column(
          children: [
            SearchBar(controller: _controller),
            CurrentWeather(weather: _controller.weather),
            DailyWeather(data: _controller.weather.daily)
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBox(
        child: AnimatedBuilder(
          animation: _controller.state,
          builder: (context, widget) => _stateBuilder(_controller.state.value),
        ),
      ),
    );
  }
}
