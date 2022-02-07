class WeatherModel {
  final dynamic temp;
  final dynamic pressure;
  final dynamic humidity;
  final dynamic feelLike;
  final dynamic icon;
  final dynamic desc;
  final dynamic wind;

  double get getTemp => temp - 272.5;
  double get getFeelLike => feelLike - 272.5;

  WeatherModel(
      {this.temp,
      this.pressure,
      this.humidity,
      this.feelLike,
      this.icon,
      this.desc,
      this.wind});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temp: json["main"]["temp"],
      pressure: json["main"]["pressure"],
      humidity: json["main"]["humidity"],
      feelLike: json["main"]["feels_like"],
      icon: json["weather"][0]["icon"],
      desc: json["weather"][0]["description"],
      wind: json["wind"]["speed"],
    );
  }
}
