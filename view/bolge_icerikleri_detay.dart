import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:weather/weather.dart';

class BolgeIcerikDetay extends StatefulWidget {
  int index;
  String comment;
  String youtubeId;
  String lat, lon;

  BolgeIcerikDetay(this.index, this.comment, this.youtubeId, this.lat, this.lon,
      {Key? key})
      : super(key: key);

  @override
  _BolgeIcerikDetayState createState() => _BolgeIcerikDetayState();
}
enum AppState { NOT_DOWNLOADED, DOWNLOADING, FINISHED_DOWNLOADING }
late WeatherFactory wf;
AppState _state = AppState.NOT_DOWNLOADED;
String url = "";
List<Weather> _data = [];
late double lat2, lon2;
String key = "e6ac6f90f9ededf64cc90d4ebc2ae094";

class _BolgeIcerikDetayState extends State<BolgeIcerikDetay> {
  void getWeather() async {
    //lat lon string olarak firebase den geliyor double 'a çevirme işlemi yapılıyor.
    lat2 = double.parse(widget.lat);
    lon2 = double.parse(widget.lon);
    Weather weather = await wf.currentWeatherByLocation(lat2, lon2);

    setState(() {
      _data = [weather];
      _state = AppState.FINISHED_DOWNLOADING;
    });

     // _data.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    url = widget.youtubeId;
    wf = WeatherFactory(key);
  }

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: url.toString(),
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    getWeather();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              /*Text(
                _data[widget.index].temperature!.celsius!.toInt().toString() +
                    "°C",
                style: TextStyle(fontSize: 30.r, fontWeight: FontWeight.w700),
              ) ,
              SizedBox(
                width: 20.w,
              ),
              Image.network(
                  "http://openweathermap.org/img/wn/${_data[widget.index].weatherIcon}@2x.png"),*/
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.network(
                    "https://www.kocaeli.bel.tr/webfiles/userfiles/images/Kurumsal/kurumsal-kimlik/01.jpg",
                    width: 500.w,
                    height: 250.h,
                  ),
                  Image.network(
                    "https://www.kocaeli.bel.tr/webfiles/userfiles/images/Kurumsal/kurumsal-kimlik/01.jpg",
                    width: 500.w,
                    height: 250.h,
                  ),
                  Image.network(
                    "https://www.kocaeli.bel.tr/webfiles/userfiles/images/Kurumsal/kurumsal-kimlik/01.jpg",
                    width: 500.w,
                    height: 250.h,
                  ),
                  Image.network(
                    "https://www.kocaeli.bel.tr/webfiles/userfiles/images/Kurumsal/kurumsal-kimlik/01.jpg",
                    width: 500.w,
                    height: 250.h,
                  ),
                  Image.network(
                    "https://www.kocaeli.bel.tr/webfiles/userfiles/images/Kurumsal/kurumsal-kimlik/01.jpg",
                    width: 500.w,
                    height: 250.h,
                  ),
                  Image.network(
                    "https://www.kocaeli.bel.tr/webfiles/userfiles/images/Kurumsal/kurumsal-kimlik/01.jpg",
                    width: 500.w,
                    height: 250.h,
                  ),
                  Image.network(
                    "https://www.kocaeli.bel.tr/webfiles/userfiles/images/Kurumsal/kurumsal-kimlik/01.jpg",
                    width: 500.w,
                    height: 250.h,
                  ),
                  Image.network(
                    "https://www.kocaeli.bel.tr/webfiles/userfiles/images/Kurumsal/kurumsal-kimlik/01.jpg",
                    width: 500.w,
                    height: 250.h,
                  ),
                  Image.network(
                    "https://www.kocaeli.bel.tr/webfiles/userfiles/images/Kurumsal/kurumsal-kimlik/01.jpg",
                    width: 500.w,
                    height: 250.h,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 10.0, top: 40.0),
              child: Text(
                widget.comment,
                style: TextStyle(fontSize: 30.r, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 55.h,
            ),
            SizedBox(
                width: 400.w,
                height: 80.h,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Seyahate Başla",
                        style: TextStyle(
                            fontSize: 35.r,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)))),
            SizedBox(
              height: 55.h,
            ),
            YoutubePlayer(
              width: 550.w,
              controller: _controller,
              showVideoProgressIndicator: true,
            ),
          ],
        ),
      ),
    );
  }

}
