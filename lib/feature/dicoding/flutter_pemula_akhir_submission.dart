import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class MainPageWeather extends StatefulWidget {
  const MainPageWeather({super.key});

  @override
  State<MainPageWeather> createState() => _MainPageWeatherState();
}

class _MainPageWeatherState extends State<MainPageWeather> {
  final now = DateTime.now();
  //final name = Get.arguments;

  List<String> weatherToday = [
    'Clear',
    'Cloudy',
    'Rain',
  ];

  String _funcFormatHours(int index, DateTime date) {
    String formattedTime = DateFormat.jm().format(date);
    return formattedTime;
  }

  String _funcFormatDate(DateTime date) {
    String formattedDate = DateFormat.yMMMMd().format(date);
    //print(formattedDate);
    return formattedDate;
  }

  String _funcGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 11) {
      return 'Good Morning';
    }
    if (hour < 15) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  String _funcBGCustomy() {
    var hour = DateTime.now().hour;
    if (hour < 11) {
      if (weatherToday[0] == "Rain") {
        return 'assets/images/morning_rain.png';
      } else
        return 'assets/images/morning_clear.png';
    }
    if (hour < 15) {
      if (weatherToday[0] == "Rain") {
        return 'assets/images/afternoon_rain.png';
      } else
        return 'assets/images/afternoon_clear.png';
    }
    if (hour < 18) {
      if (weatherToday[0] == "Rain") {
        return 'assets/images/evening_rain.png';
      } else
        return 'assets/images/evening_clear.png';
    } else {
      if (weatherToday[0] == "Rain") {
        return 'assets/images/night_rain.png';
      } else
        return 'assets/images/night_clear.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: DrawerWidget(),
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.darken),
                image: AssetImage(_funcBGCustomy()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: AppBar().preferredSize.height + MediaQuery.of(context).viewPadding.top + 10,
            left: 20,
            //right: 0,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _funcFormatDate(now),
                    // style: GoogleFonts.comicNeue(
                    //   fontSize: 18,
                    //   fontWeight: FontWeight.w600,
                    //   color: Colors.white,
                    // ),
                  ),
                  Text(
                    '${_funcGreeting()}, ',
                    // style: GoogleFonts.rancho(
                    //   fontSize: 40,
                    //   fontWeight: FontWeight.w600,
                    //   color: Colors.white,
                    // ),
                  ),
                  Text(
                    'You',
                    // style: GoogleFonts.comicNeue(
                    //   fontSize: 16,
                    //   color: Colors.white,
                    //   fontWeight: FontWeight.w600,
                    // ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            //right: 0,
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                ),
                                Text(
                                  'Bandung',
                                  // style: GoogleFonts.comicNeue(
                                  //   fontSize: 16,
                                  //   color: Colors.white,
                                  //   fontWeight: FontWeight.w600,
                                  // ),
                                ),
                              ],
                            ),
                            Text(
                              '10' + '\u2103',
                              // style: GoogleFonts.comicNeue(
                              //   fontSize: 40,
                              //   fontWeight: FontWeight.w600,
                              //   color: Colors.white,
                              // ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Clear',
                                  // style: GoogleFonts.comicNeue(
                                  //   fontSize: 18,
                                  //   fontWeight: FontWeight.w600,
                                  //   color: Colors.white,
                                  // ),
                                ),
                                // Container(
                                //   width: 50,
                                //   height: 50,
                                //   //color: Colors.red,
                                //   child: Align(
                                //     alignment: Alignment.bottomCenter,
                                //     child: Image.network("http://openweathermap.org/img/w/" +
                                //         controller.listIconToday[0].icon! +
                                //         ".png"),
                                //   ),
                                // ),
                              ],
                            ),
                            // Text(
                            //   'Humidity ' +
                            //       controller.weatherToday.main.humidity
                            //           .toString() +
                            //       '%',
                            //   style: GoogleFonts.comicNeue(
                            //     color: Colors.white,
                            //     fontSize: 16,
                            //   ),
                            //   overflow: TextOverflow.ellipsis,
                            // ),
                            // Text(
                            //   'Wind ' +
                            //       controller.weatherToday.wind.speed
                            //           .toString() +
                            //       ' m/s',
                            //   style: GoogleFonts.comicNeue(
                            //     color: Colors.white,
                            //     fontSize: 16,
                            //   ),
                            //   overflow: TextOverflow.ellipsis,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hourly',
                        // style: GoogleFonts.comicNeue(
                        //   color: Colors.white,
                        //   fontWeight: FontWeight.w600,
                        // ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 20),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 100,
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.amber,
                                ),
                                Text(
                                  'Panas',
                                  // style: GoogleFonts.comicNeue(
                                  //   color: Colors.white,
                                  //   fontWeight: FontWeight.w600,
                                  // ),
                                ),
                                Text(
                                  '10:00',
                                  // style: GoogleFonts.comicNeue(
                                  //   color: Colors.white,
                                  //   fontWeight: FontWeight.w600,
                                  // ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.lightGreen[200],
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
        // Important: Remove any padding from the ListView.
        //padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Select City',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Bandung'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Jakarta'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          Spacer(),
          ListTile(
            title: const Text('Jakarta'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
