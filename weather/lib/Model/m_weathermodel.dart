class WeatherApp{

  String cityName;
  double temp;
  double wind;
  int humidity;
  double feels_like;
  int pressure;
  WeatherApp({
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.feels_like,
    this.pressure
});

  //now let's build a function to parse the Json file into the model

 WeatherApp.fromJson(Map<String,dynamic> json){
   cityName = json['name']?? "";
   temp = json['main']['temp']??"";
   wind = json['wind']['speed']??"";
   pressure=json['main']['pressure']??"";
   humidity=json['main']['humidity']??"";
   feels_like=json['main']['feels_like']??"";





 }



}