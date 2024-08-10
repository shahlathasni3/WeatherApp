import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';
// import 'package:weather/weather.dart';
// import 'package:weatherapp/consts.dart';

import 'login.dart';

class home extends StatefulWidget {
   home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  // final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);

  // Weather? _weather;
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _wf.currentWeatherByCityName("Kozhikode").then((w) {
  //     setState(() {
  //       _weather = w;
  //
  //
  //     });
  //   });
  // }

  String locationMessage = 'Current Location of the user';

  late String lat;
  late String long;
//location enable
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Future.error('Location service are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission == await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('Location permission are denied');
      }
    }
    if(permission == LocationPermission.deniedForever){
      return Future.error("Location permission are permenently denied,we cannot request permission");
    }
    return await Geolocator.getCurrentPosition();
  }

  // livelocation
  void _liveLocation(){
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    Geolocator.getPositionStream(locationSettings : locationSettings)
          .listen((Position position) {
            lat = position.latitude.toString();
            long = position.longitude.toString();

            setState(() {
              locationMessage = 'Latitude : $lat , Longtitude : $long';
            });
    }
        );

  }
// open the curerent location in googlemap
Future<void> _openMap(String lat, String long) async {
    String googleURL ="https://www.google.com/maps/search/?api=1&query=$lat,$long";
    await canLaunchUrlString(googleURL)
        ? await launchUrlString(googleURL)
        : throw 'Could not launch $googleURL';
}
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: InkWell(
            onTap:  () {Navigator.push( context,MaterialPageRoute(builder: (context) => login()));},
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Image.asset(
              "assets/icon.webp",
              scale: 7,
            ),
          )
        ],
        elevation: 0,
      ),
      body: Container(
        height: height * 1,
        width: width * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffAD52D0),
              Color(0xff5A42B1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 145,left: 125),

                  child: ElevatedButton(
                      onPressed: () {
                        _getCurrentLocation().then((value){
                          lat = '${value.latitude}';
                          long = '${value.longitude}';
                          setState(() {
                            locationMessage = 'Latitude : $lat , Longtitude : $long';
                          });
                          _liveLocation();
                        });
                      },
                    child: Text(
                      "Get Current Location",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 140),
              child: ElevatedButton(
                  onPressed: () {
                    _openMap(lat,long);
                  },
                  child: Text("Open Google Map"),
              ),
            ),

            // Widget _locationHeader(){
            //   return Text(_weather?.areaName ??"",
            //     style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),);
            //
            // }
          ],
        ),
      ),
    );

  }
}