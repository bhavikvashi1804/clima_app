import 'package:flutter/material.dart';


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
        child: RaisedButton(
          onPressed: () {
           
          
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }

  
}
