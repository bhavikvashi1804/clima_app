import 'package:geolocator/geolocator.dart';

class Location{
  double latitude,longitude;

  Future getLocation() async {

    //try catch for exception
    try{
      Position position=await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      longitude=position.longitude;

      print(position);
    }
    catch(exception){
      print(exception);
    }
    //wait is used for to wait for perticular event that return data which takes time to prepare 
  }


}

