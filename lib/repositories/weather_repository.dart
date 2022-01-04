
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {

  Future<http.Response> getData(Position position) {
    final uri = Uri(
      scheme: "https",
      host: 'api.openweathermap.org',
      path: 'data/2.5/onecall',
      queryParameters: {
        'lat': position.latitude.toString(),
        'lon': position.longitude.toString(),
        'units': 'metric',
        'lang': 'pt_br',
        'exclude': 'minutely',
        'appid': '7a46aaa80b819dfaa6a656961cb5742d'
      },
    );

    return http.get(uri);
  }
}