import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../screens/location_screen.dart';
import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  
  
  void getLocation()async{
  
    var weatherData=await WeatherModel().getLocationWeather();
    
    Navigator.push(context,
      MaterialPageRoute(
        builder: (context)=>LocationScreen(weatherData),
      ) 
    );

  }


  
  

  @override
  void initState() {
    //init state is used when we have data which want to load as soon as app start 
    //user does not have to anything 
    //under the init method all code executes Automatically
    super.initState();
  
    getLocation();
  
    //gets location of user with out any user interactiom
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          size: 100.0,
          color: Colors.cyan,
        ),
      ),
    );
  }

  
}