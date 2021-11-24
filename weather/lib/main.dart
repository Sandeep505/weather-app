import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:weather/Model/m_weathermodel.dart';
import 'package:weather/Service/weather_api_data.dart';
import 'package:weather/views/additional_information.dart';
import 'package:weather/views/current_weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );


  }
}

class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Now let's test if everything work
  //we will call the api in the init state function
  WeatherApiClient client = WeatherApiClient();
  WeatherApp data;
  @override
  void initState() {
    //TODO: implement initstate
    super.initState();
    client.getCurrentweather("Delhi");
    //okey now everything work
    //but we will use a better method to call the api
    // FutureBuilder widget
  }

  Future<void> getData() async{
    data=await client.getCurrentweather("Chennai");
  }
  @override
  Widget build(BuildContext context) {
    // the first thing that we're going to do is to create the UI of the App
    return Scaffold(
      backgroundColor: Color(0xFFf9f9f9),
      appBar: AppBar(
        backgroundColor: Color(0xFFf9f9f9),
        elevation: 0.0,
        title:  Text("Weather App",style: TextStyle(color:Colors.black),),
        centerTitle: true,
        leading: IconButton(onPressed: (){},icon:Icon(Icons.menu),
        color:Colors.black,
        ),
      ),
      body:FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            //here we will display if we get data from the API
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //let's create custom widget for the app
                currentWeather(Icons.wb_sunny_rounded, "${data.temp}", "${data.cityName}"),
                SizedBox(
                  height: 60.0,
                ),
                Text(
                  "Additional information",style: TextStyle(fontSize: 24.0,color:Color(0xdd212121),fontWeight: FontWeight.bold,),
                ),
                Divider(),
                SizedBox(
                  height:20.0,
                ),
                //Now let's create the additional information widget
                additionalInformation("${data.wind}", "${data.humidity}", "${data.pressure}", "${data.feels_like}"),
                //Now that we have the UI ready
                //Let's start integrating the API
                //first let's start creating the model to store the data

              ],
            );
          }
          else if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child:CircularProgressIndicator(),
            );
          }
          return Container();
        },
      )

    );
  }
}

