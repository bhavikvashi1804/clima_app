import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:clima/screens/location_screen.dart';

import '../services/location.dart';
import '../services/networking.dart';


const apiKey='60223a0a2655f6c1379ff1b548eefaa6';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude,longitude;
  
  void getLocation()async{
    Location uLoc=Location();
    await uLoc.getLocation();
    latitude=uLoc.latitude;
    longitude=uLoc.longitude;

    String url='https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';

    NetworkHelper nh1=NetworkHelper(url);
    var weatherData=await nh1.getData();
    
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