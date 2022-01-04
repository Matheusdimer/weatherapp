import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/utils/utils.dart';

class CurrentWeather extends StatelessWidget {
  final Map<String, dynamic> weather;

  final temperaturaStyle = GoogleFonts.openSans(
    fontSize: 70,
    fontWeight: FontWeight.w300,
    color: Colors.white,
    decoration: TextDecoration.none,
  );

  final normalFont = GoogleFonts.openSans(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    decoration: TextDecoration.none,
  );

  CurrentWeather({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' ${parseTemperature(weather["current"]["temp"])}',
              style: temperaturaStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    "http://openweathermap.org/img/wn/${weather["current"]["weather"][0]["icon"]}@2x.png",
                    scale: 2,
                  ),
                  Text(
                    parseTitle(weather["current"]["weather"][0]["description"]),
                    style: normalFont,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.air_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    (weather["current"]["wind_speed"] as double)
                            .toStringAsFixed(0) +
                        " km/h",
                    style: normalFont,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
