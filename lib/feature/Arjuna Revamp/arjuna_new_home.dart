import 'package:flutter/material.dart';

class ArjunaNewHome extends StatefulWidget {
  const ArjunaNewHome({super.key});

  @override
  State<ArjunaNewHome> createState() => _ArjunaNewHomeState();
}

class _ArjunaNewHomeState extends State<ArjunaNewHome> {
  final TextEditingController _searchController = TextEditingController();
  late int currentIndex = 0;
  late ValueChanged<int> onClick = (value) {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The Title',
          style: TextStyle(color: Colors.red[900]),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            //clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: const BoxDecoration(
                      //color: Colors.amber,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile_background.png'),
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150 / 3,
                    color: Colors.white,
                  )
                ],
              ),
              Positioned(
                top: (MediaQuery.of(context).size.height / 4) - (MediaQuery.of(context).size.height / 4.5),
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8.0),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Search...',
                          // Add a search icon or button to the search bar
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              // Perform the search here
                            },
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.black)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      //width: MediaQuery.of(context).size.width / 1.1,
                      child: Card(
                        clipBehavior: Clip.hardEdge,
                        elevation: 8,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("Welcome,"),
                                    SizedBox(height: 10),
                                    Text("Kagamihara Nadeshiko",
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                            TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10),
                                    Text("596216 - Solo Camper"),
                                  ],
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red.shade100,
                                  image: const DecorationImage(
                                      image: AssetImage("assets/images/avatar_profile_icon.png"), fit: BoxFit.contain),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 86,
        height: 86,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              print('object');
            },
            child: BottomNavigationButton(
              currentIndex: currentIndex,
              onClick: onClick,
              widgetIndex: 3,
              label: "Setting",
              assetImage: "assets/images/setting_2.png",
            ),
            // Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     SizedBox(
            //       height: MediaQuery.of(context).size.height * 0.04,
            //       child: Image.asset(
            //         'assets/images/attendance_2.png',
            //         color: Colors.grey,
            //       ),
            //     ),
            //     const Text(
            //       'Attendance',
            //       style: TextStyle(color: Colors.grey, fontSize: 4.5, fontWeight: FontWeight.w500),
            //     )
            //   ],
            // ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight + 10,
        color: Colors.transparent,
        child: BottomAppBar(
          //bottom navigation bar on scaffold
          color: Colors.white,
          shape: CircularNotchedRectangle(), //shape of notch
          notchMargin: 5, //notche margin between floating button and bottom appbar
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BottomNavigationButton(
                currentIndex: currentIndex,
                onClick: onClick,
                widgetIndex: 0,
                label: "Home",
                assetImage: "assets/images/home_2.png",
              ),
              BottomNavigationButton(
                currentIndex: currentIndex,
                onClick: onClick,
                widgetIndex: 1,
                label: "HySpace",
                assetImage: "assets/images/hyspace.png",
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.1),
              BottomNavigationButton(
                onClick: onClick,
                currentIndex: currentIndex,
                widgetIndex: 2,
                label: "Profile",
                assetImage: "assets/images/profile.png",
              ),
              BottomNavigationButton(
                currentIndex: currentIndex,
                onClick: onClick,
                widgetIndex: 3,
                label: "Setting",
                assetImage: "assets/images/setting_2.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavigationButton extends StatelessWidget {
  final int widgetIndex;
  final int currentIndex;
  final String label;
  final String? assetImage;
  final ValueChanged<int> onClick;
  final double width;

  static TextStyle selectedNavBarItem = TextStyle(
    color: Colors.red[900],
    fontWeight: FontWeight.bold,
    fontSize: 8.5,
  );

  static TextStyle unselectedNavBarItem = TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 8.5);

  BottomNavigationButton(
      {required this.widgetIndex,
      required this.currentIndex,
      required this.label,
      this.assetImage,
      required this.onClick,
      this.width = 50});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomNavigationBarHeight,
      width: width,
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        child: InkWell(
          onTap: () => onClick(widgetIndex),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                assetImage ?? "assets/icons/settings_unselected.png",
                height: MediaQuery.of(context).size.height * 0.04,
                color: widgetIndex == currentIndex ? Colors.red[900] : Colors.grey,
              ),
              Text(label, style: widgetIndex == currentIndex ? selectedNavBarItem : unselectedNavBarItem)
            ],
          ),
        ),
      ),
    );
  }
}
