import 'package:flutter/material.dart';
import 'package:weatherapp/controllers/weather_controller.dart';

class SearchBar extends StatelessWidget {
  final WeatherController controller;

  const SearchBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.2),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      padding: const EdgeInsets.only(left: 25, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 230,
            child: TextField(
              controller: controller.searchController,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              cursorColor: Colors.white,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () => controller.getWeather(),
            icon: const Icon(
              Icons.location_on,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
