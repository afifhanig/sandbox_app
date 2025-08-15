import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/controller/app_controller.dart';
import 'package:sandbox_flutter_3/feature/lazy_load/blank_page.dart';
import 'package:image/image.dart' as img;

class LazyLoadExamplePage extends StatefulWidget {
  const LazyLoadExamplePage({super.key});

  @override
  State<LazyLoadExamplePage> createState() => _LazyLoadExamplePageState();
}

class _LazyLoadExamplePageState extends State<LazyLoadExamplePage> {
  final AppController _appController = Get.put(AppController());
  Map<int, bool> _isItemTappedMap = {};
  Map<int, bool> _hasColorChangedMap = {};
  var profilePicture;
  int total = 1;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   print('init state');
  //   sc.addListener(() {
  //     if (sc.position.pixels == sc.position.maxScrollExtent) {
  //       _getMoreData();
  //       print('max scroll');
  //     }
  //     ;
  //   });
  // }

  // _getMoreData() {

  // }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      convertImg();
    });
    super.initState();
  }

  convertImg() async {
    ByteData byteData = await rootBundle.load('assets/images/profile_pic.jpg');
    Uint8List uint8List = byteData.buffer.asUint8List();
    img.Image image = img.decodeImage(uint8List)!;
    String base64String = base64Encode(uint8List);

    debugPrint(base64String);
    setState(() {
      profilePicture = base64String;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _appController.refreshData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Lazy Load Large List"),
        ),
        body: GetBuilder<AppController>(builder: ((controller) {
          return Column(
            children: [
              // Container(
              //   height: 100,
              //   width: double.infinity,
              //   color: Colors.amber,
              //   child: ElevatedButton(
              //     child: Text('Move'),
              //     onPressed: () {
              //       _appController.navigate();
              //     },
              //   ),
              // ),
              // total > 0
              //     ? Expanded(
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
              //               width: double.infinity,
              //               padding: EdgeInsets.all(8),
              //               color: Colors.white,
              //               child: Text('Matching Employee'),
              //             ),
              //             Expanded(child: _buildList()
              //                 // ListView.builder(
              //                 //   itemBuilder: ((context, index) {
              //                 //     return ListTile(
              //                 //       leading: CircleAvatar(
              //                 //         backgroundColor: Colors.amber,
              //                 //       ),
              //                 //       title: Text('Nama'),
              //                 //       subtitle: Text('Alamat'),
              //                 //     );
              //                 //   }),
              //                 // ),
              //                 )
              //           ],
              //         ),
              //       )
              //     : Container(),
            ],
          );
        })),
        resizeToAvoidBottomInset: false,
        // GetBuilder<AppController>(
        //   builder: (controller) {
        //     return Container(
        //       child: _buildList(),
        //     );
        //   },
        // ),
      ),
    );
  }

  Widget _buildListOffline() {
    return ListView.builder(
      shrinkWrap: true,
      controller: _appController.sc,
      itemCount: _appController.dataToShow.length + 1,
      itemBuilder: ((context, index) {
        if (index == _appController.dataToShow.length) {
          return _buildIndicator();
        } else {
          return GestureDetector(
            onTap: () {
              _handleItemTap(index);
            },
            child: SizedBox(
              height: 150,
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Nama ${_appController.dataToShow[index]}'),
                    const Text('Alamat'),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }

  Widget _buildListObjectOffline() {
    return ListView.builder(
      shrinkWrap: true,
      controller: _appController.sc,
      itemCount: _appController.objectToSHow.length + 1,
      itemBuilder: ((context, index) {
        if (index == _appController.objectToSHow.length) {
          return _buildIndicator();
        } else {
          return SizedBox(
            height: 150,
            width: double.infinity,
            child: GestureDetector(
              onTap: () {
                Get.to(const BlankPage());
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('index $index'),
                    Text('Nama ${_appController.objectToSHow[index].nama}'),
                    Text('Alamat ${_appController.objectToSHow[index].alamat}'),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }

  Widget _buildList() {
    var theImg = base64Decode(profilePicture);
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      shrinkWrap: true,
      itemCount: _appController.users.length + 1,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      itemBuilder: (BuildContext context, int index) {
        if (index == _appController.users.length) {
          return _buildIndicator();
        } else {
          bool isTapped = _isItemTappedMap[index] ?? false;
          bool hasColorChanged = _hasColorChangedMap[index] ?? false;
          return GestureDetector(
            onTap: () {
              _handleItemTap(index);
            },
            child: ListTile(
              tileColor: isTapped || hasColorChanged ? Colors.amber : Colors.red,
              leading: CircleAvatar(
                radius: 30.0,
                //foregroundImage: Image.memory(base64Decode(profilePicture), gaplessPlayback: true).image,
                backgroundImage:
                    //MemoryImage(theImg)
                    Image.memory(theImg, gaplessPlayback: true).image,
                //('assets/images/profile_pic.jpg'),
                // backgroundImage: NetworkImage(
                //   _appController.users[index]['picture']['large'],
                // ),
              ),
              title: Text((_appController.users[index]['name']['first'])),
              subtitle: Text((_appController.users[index]['email'])),
            ),
          );
        }
      },
      controller: _appController.sc,
    );
  }

  Widget _buildIndicator() {
    //print('woy => ${_appController.isLoading}');
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _appController.isLoading
                  ? Opacity(
                      opacity: _appController.isLoading ? 1.0 : 00,
                      child: const CircularProgressIndicator(),
                    )
                  : Container(),
              _appController.isAllDataLoaded ? Container(color: Colors.transparent, child: const Text('All Data is Loaded')) : Container(),
            ],
          ),
        ),
      ),
    );
  }

  void _handleItemTap(int itemIndex) {
    setState(() {
      if (!_hasColorChangedMap.containsKey(itemIndex)) {
        _isItemTappedMap[itemIndex] = true;
        _hasColorChangedMap[itemIndex] = true;
      }
    });
  }
}
