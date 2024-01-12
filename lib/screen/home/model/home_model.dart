class HomeModel {
  int? visibility, dt, timezone, id, cod;
  String? name, base;
  CoordModel? coordModel;
  MainModel? mainModel;
  WindModel? windModel;
  CloudModel? cloudModel;
  SysModel? sysModel;
  List<WeatherModel>? weatherList = [];

  HomeModel(
      {this.visibility,
      this.dt,
      this.timezone,
      this.id,
      this.cod,
      this.name,
      this.base,
      this.coordModel,
      this.mainModel,
      this.windModel,
      this.cloudModel,
      this.sysModel,
      this.weatherList});

  factory HomeModel.mapToModel(Map m1) {
    List l1 = m1['weather'];
    return HomeModel(
      id: m1['id'],
      name: m1['name'],
      cod: m1['cod'],
      base: m1['base'],
      dt: m1['dt'],
      visibility: m1['visibility'],
      timezone: m1['timezone'],
      windModel: WindModel.mapToModel(m1['wind']),
      sysModel: SysModel.mapToModel(m1['sys']),
      mainModel: MainModel.mapToModel(m1['main']),
      coordModel: CoordModel.mapToModel(m1['coord']),
      cloudModel: CloudModel.mapToModel(m1['clouds']),
      weatherList: l1.map((e) => WeatherModel.mapToModel(e)).toList(),
    );
  }
}

class CoordModel {
  double? lon, lat;

  CoordModel({this.lon, this.lat});

  factory CoordModel.mapToModel(Map m1) {
    return CoordModel(
      lon: m1['lon'],
      lat: m1['lat'],
    );
  }
}

class WeatherModel {
  int? id;
  String? main, description, icon;

  WeatherModel({this.id, this.main, this.description, this.icon});

  factory WeatherModel.mapToModel(Map m1) {
    return WeatherModel(
      icon: m1['icon'],
      id: m1['id'],
      description: m1['description'],
      main: m1['main'],
    );
  }
}

class MainModel {
  double? temp, feels_like, temp_min, temp_max;
  int? pressure, humidity;

  MainModel(
      {this.temp,
      this.feels_like,
      this.temp_min,
      this.temp_max,
      this.pressure,
      this.humidity});

  factory MainModel.mapToModel(Map m1) {
    return MainModel(
      temp_max: m1['temp_max'],
      temp: m1['temp'],
      pressure: m1['pressure'],
      humidity: m1['humidity'],
      feels_like: m1['feels_like'],
      temp_min: m1['temp_min'],
    );
  }
}

class WindModel {
  double? speed;
  int? deg;

  WindModel({this.speed, this.deg});

  factory WindModel.mapToModel(Map m1) {
    return WindModel(
      speed: m1['speed'],
      deg: m1['deg'],
    );
  }
}

class CloudModel {
  int? all;

  CloudModel({this.all});

  factory CloudModel.mapToModel(Map m1) {
    return CloudModel(all: m1['all']);
  }
}

class SysModel {
  int? type, id, sunrise, sunset;
  String? country;

  SysModel({this.type, this.id, this.sunrise, this.sunset, this.country});

  factory SysModel.mapToModel(Map m1) {
    return SysModel(
      id: m1['id'],
      type: m1['type'],
      sunset: m1['sunset'],
      sunrise: m1['sunrise'],
      country: m1['country'],
    );
  }
}
