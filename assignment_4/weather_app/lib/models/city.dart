import 'package:weather_app/models/picker_data.dart';

class City {
  late int id;
  late String name;
  late String state;
  late String country;
  late Coord coord;

  City(this.id, this.name, this.state, this.country, this.coord);

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    state = json['state'];
    country = json['country'];
    coord = Coord.fromJson(json['coord']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['state'] = this.state;
    data['country'] = this.country;
    data['coord'] = this.coord.toJson();
    return data;
  }

  @override
  String toString() {
    return this.name;
  }
}

class Coord {
  late double lon;
  late double lat;

  Coord(this.lon, this.lat);

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    return data;
  }
}
