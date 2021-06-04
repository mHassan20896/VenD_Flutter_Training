import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/models/city.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/presentation/loader.dart';
import 'package:weather_app/presentation/picker_widget.dart';
import 'package:weather_app/service/weather_service.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _loadingState = false;
  TextEditingController _cityName = TextEditingController();
  WeatherService service = WeatherService();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: backgroundImage(),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Loader(
            isTrue: _loadingState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Weather App",
                  style: GoogleFonts.lobster(fontSize: 60, color: Colors.white),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GestureDetector(
                    onTap: () async {
                      setState(() {
                        _loadingState = true;
                      });
                      List<City> cities = await service.getCityList();
                      setState(() {
                        _loadingState = false;
                      });
                      dataPicker(
                        context,
                        cities,
                        title: "Select City",
                        onSelect: (selectedValue) {
                          City parsedValue = selectedValue as City;
                          _cityName.text = parsedValue.name;
                        },
                      );
                    },
                    child: AbsorbPointer(
                      child: customisedTextField(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  width: double.infinity,
                  height: 70,
                  child: TextButton(
                    onPressed: () async {
                      if (_cityName.text.isNotEmpty) {
                        setState(() {
                          _loadingState = true;
                        });
                        try {
                          GetWeatherResponse weatherResponse =
                              await service.getWeatherUpdate(_cityName.text);
                          showInfo(weatherResponse);
                          setState(() {
                            _loadingState = false;
                          });
                        } catch (e) {
                          setState(() {
                            _loadingState = false;
                          });
                        }
                      }
                    },
                    child: Text(
                      "Go",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xff128c7e),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  DecorationImage backgroundImage() {
    return DecorationImage(
      image: AssetImage("assets/wallpaper.jpeg"),
      fit: BoxFit.cover,
    );
  }

  Widget customisedTextField() {
    return TextField(
      controller: _cityName,
      decoration: new InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        filled: true,
        hintStyle: new TextStyle(color: Colors.grey[800]),
        hintText: "Type in your text",
        fillColor: Colors.white70,
      ),
    );
  }

  showInfo(GetWeatherResponse weatherResponse) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Weather Details"),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text("OK"))
            ],
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(weatherResponse.name!),
                Text(weatherResponse.weather!.first.description!),
                Text(weatherResponse!.main!.temp!.toString())
              ],
            ),
          );
        });
  }
}
