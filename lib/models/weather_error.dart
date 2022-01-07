class WeatherError {
  String message;
  int? status;

  WeatherError(this.message, this.status);

  WeatherError.simple(this.message);

  factory WeatherError.fromJson(dynamic json) => WeatherError(json['message'], json['status']);
}