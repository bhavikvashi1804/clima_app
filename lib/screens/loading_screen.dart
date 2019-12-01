import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


import '../services/location.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  
  void getLocation()async{
    Location uLoc=Location();
    await uLoc.getLocation();
    print(uLoc.longitude+uLoc.latitude);
  }


  void getData()async {
    http.Response response=await http.get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    print(response.body);
    var data=response.body;

    double temperature=jsonDecode(data)['main']['temp'];
    print(temperature);

    String cityName=jsonDecode(data)['name']; 
    print(cityName);
  
    int id=jsonDecode(data)['weather'][0]['id'];
    print(id);    

    
  }
  

  @override
  void initState() {
    //init state is used when we have data which want to load as soon as app start 
    //user does not have to anything 
    //under the init method all code executes Automatically
    super.initState();

    getLocation();
    getData();
    //gets location of user with out any user interactiom
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
           
          
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }

  
}
