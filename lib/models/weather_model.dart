class WeatherModel {
  WeatherModel(
    this.lat,
    this.lon,
    this.current,
    this.hourly,
    this.daily,
  );

  WeatherModel.fromJson(dynamic json) {
    lat = json['lat'];
    lon = json['lon'];
    current = Current.fromJson(json['current']);

    if (json['hourly'] != null) {
      json['hourly'].forEach((v) {
        hourly.add(Hourly.fromJson(v));
      });
    }

    if (json['daily'] != null) {
      json['daily'].forEach((v) {
        daily.add(Daily.fromJson(v));
      });
    }
  }

  late double lat;
  late double lon;
  late Current current;
  List<Hourly> hourly = [];
  List<Daily> daily = [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lon'] = lon;
    map['current'] = current.toJson();
    map['hourly'] = hourly.map((v) => v.toJson()).toList();
    map['daily'] = daily.map((v) => v.toJson()).toList();
    return map;
  }
}

class Daily {
  Daily(
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.uvi,
  );

  Daily.fromJson(dynamic json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = resolveNumber(json['moon_phase']);
    temp = Temp.fromJson(json['temp']);
    feelsLike = FeelsLike.fromJson(json['feels_like']);
    pressure = resolveNumber(json['pressure']);
    humidity = resolveNumber(json['humidity']);
    dewPoint = resolveNumber(json['dew_point']);
    windSpeed = resolveNumber(json['wind_speed']);
    windDeg = resolveNumber(json['wind_deg']);
    windGust = resolveNumber(json['wind_gust']);
    json['weather'].forEach((v) {
      weather.add(Weather.fromJson(v));
    });
    clouds = json['clouds'];
    pop = resolveNumber(json['pop']);
    uvi = resolveNumber(json['uvi']);
  }

  late int dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  double? moonPhase;
  late Temp temp;
  FeelsLike? feelsLike;
  double? pressure;
  double? humidity;
  double? dewPoint;
  double? windSpeed;
  double? windDeg;
  double? windGust;
  List<Weather> weather = [];
  int? clouds;
  double? pop;
  double? uvi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    map['moonrise'] = moonrise;
    map['moonset'] = moonset;
    map['moon_phase'] = moonPhase;
    map['temp'] = temp.toJson();
    map['feels_like'] = feelsLike!.toJson();
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    map['dew_point'] = dewPoint;
    map['wind_speed'] = windSpeed;
    map['wind_deg'] = windDeg;
    map['wind_gust'] = windGust;
    map['weather'] = weather.map((v) => v.toJson()).toList();
    map['clouds'] = clouds;
    map['pop'] = pop;
    map['uvi'] = uvi;
    return map;
  }
}

class Weather {
  Weather(
    this.id,
    this.main,
    this.description,
    this.icon,
  );

  Weather.fromJson(dynamic json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  late int id;
  late String main;
  late String description;
  late String icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }
}

class FeelsLike {
  FeelsLike(
    this.day,
    this.night,
    this.eve,
    this.morn,
  );

  FeelsLike.fromJson(dynamic json) {
    day = json['day'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  late double day;
  late double night;
  late double eve;
  late double morn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['night'] = night;
    map['eve'] = eve;
    map['morn'] = morn;
    return map;
  }
}

class Temp {
  Temp(this.day, this.min, this.max, this.night, this.eve, this.morn);

  Temp.fromJson(dynamic json) {
    day = json['day'];
    min = json['min'];
    max = json['max'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  late double day;
  late double min;
  late double max;
  late double night;
  late double eve;
  late double morn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['min'] = min;
    map['max'] = max;
    map['night'] = night;
    map['eve'] = eve;
    map['morn'] = morn;
    return map;
  }
}

class Hourly {
  Hourly(
    this.dt,
    this.temp,
    this.feelsLike,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.weather,
  );

  Hourly.fromJson(dynamic json) {
    dt = json['dt'];
    temp = resolveNumber(json['temp']);
    feelsLike = resolveNumber(json['feels_like']);
    clouds = json['clouds'];
    visibility = json['visibility'];
    windSpeed = resolveNumber(json['wind_speed']);
    weather = [];
    json['weather'].forEach((v) {
      weather.add(Weather.fromJson(v));
    });
  }

  late int dt;
  late double temp;
  late double feelsLike;
  late int clouds;
  late int visibility;
  late double windSpeed;
  List<Weather> weather = [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['clouds'] = clouds;
    map['visibility'] = visibility;
    map['wind_speed'] = windSpeed;
    map['weather'] = weather.map((v) => v.toJson()).toList();
    return map;
  }
}

class Current {
  Current(
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.windSpeed,
    this.weather,
  );

  Current.fromJson(dynamic json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = resolveNumber(json['temp']);
    feelsLike = resolveNumber(json['feels_like']);
    windSpeed = resolveNumber(json['wind_speed']);
    json['weather'].forEach((v) {
      weather.add(Weather.fromJson(v));
    });
  }

  late int dt;
  late int sunrise;
  late int sunset;
  late double temp;
  late double feelsLike;
  late double windSpeed;
  List<Weather> weather = [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['wind_speed'] = windSpeed;
    map['weather'] = weather.map((v) => v.toJson()).toList();
    return map;
  }
}

double resolveNumber(Object object) {
  if (object is int) {
    return object.toDouble();
  } else if (object is double) {
    return object;
  } else {
    return double.parse(object.toString());
  }
}
