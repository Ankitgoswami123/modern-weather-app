import 'package:http/http.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Location{
  String ? Latitude;
  String ? Longitude;
  Future<void> getCurrentLocation ()async{
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled=await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      Fluttertoast.showToast(msg: 'Location Service is disabled.');
    }
    permission = await Geolocator.checkPermission();
    if(permission==LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission==LocationPermission.denied){
        Fluttertoast.showToast(msg: 'You denied the permission');
      }
    }
    if(permission==LocationPermission.deniedForever){
      Fluttertoast.showToast(msg: 'You denied the permission forever.');
    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  Latitude = position.latitude.toString();
  Longitude = position.longitude.toString();
  }

}