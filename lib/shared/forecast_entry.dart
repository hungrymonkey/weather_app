class ForecastEntry{
  final String condition;
  final num temp;
  final num maxTemp;
  final num minTemp;
  final String iconType;
  final DateTime forecastTime;
  //final num rain;
  ForecastEntry({
    this.condition,this.temp, this.minTemp,
    this.maxTemp,this.iconType, this.forecastTime, //this.rain,
  });
}