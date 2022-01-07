import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/utils/utils.dart';

class DailyWeather extends StatelessWidget {
  final List<Daily> data;

  DailyWeather({Key? key, required this.data}) : super(key: key);

  final textStyle = GoogleFonts.openSans(
    color: Colors.white,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  final temperatureStyle = GoogleFonts.openSans(
    color: Colors.white,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w400,
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final Daily day = data[index];
            final DateTime date =
                DateTime.fromMillisecondsSinceEpoch(day.dt * 1000);
            final weather = day.weather[0];

            return InkWell(
              onTap: () => Navigator.pushNamed(context, "/detail"),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(250, 250, 250, 0.1),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                height: 60,
                margin: const EdgeInsets.only(
                  bottom: 10,
                ),
                padding: const EdgeInsets.only(
                  right: 15,
                  left: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          "http://openweathermap.org/img/wn/${weather.icon}@2x.png",
                          scale: 2,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              formatWeekDay(date),
                              style: textStyle,
                            ),
                            Text(
                              parseTitle(weather.description),
                              style: textStyle,
                            )
                          ],
                        )
                      ],
                    ),
                    Text(
                      "${parseTemperature(day.temp.max)} / ${parseTemperature(day.temp.min)}",
                      style: temperatureStyle,
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  String formatWeekDay(DateTime date) {
    var weekDay =
        date.day == DateTime.now().day ? "Hoje" : weekDays[date.weekday - 1];

    return '$weekDay, ${date.day} de ${monthNames[date.month - 1]}';
  }
}
