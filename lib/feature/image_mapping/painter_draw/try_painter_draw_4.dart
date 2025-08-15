import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/controller/contoh_controller.dart';
import 'package:sandbox_flutter_3/controller/desk_controller.dart';
import '../choose_seat/image_map.dart';
import 'dart:io';

class TryPainterDrawFour extends StatefulWidget {
  const TryPainterDrawFour({super.key});

  @override
  State<TryPainterDrawFour> createState() => _TryPainterDrawOneState();
}

class _TryPainterDrawOneState extends State<TryPainterDrawFour> {
  final ScrollController _horizontal = ScrollController(), _vertical = ScrollController();
  late DeskController _deskController;
  final events = [];

  @override
  void initState() {
    // TODO: implement initState
    _deskController = Get.put(DeskController());
    super.initState();
  }

  void handleRegionTap(int index) {
    print(_deskController.regionsData[index]['status']);
    if (!_deskController.isSkrolling.value) {
      if (_deskController.regionsData[index]['status'] == 'AVAILABLE') {
        setState(() {
          _deskController.regionsData[index]['selected'] = !_deskController.regionsData[index]['selected'];
          _deskController.selectedRegionTaps.value = _deskController.regionsData
              .where((data) => data['selected'])
              .map<String>((data) => data['regionTap'])
              .toList();
        });
        Get.bottomSheet(Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('You\'re about to book a seat : '),
              Text('${_deskController.selectedRegionTaps[0]}', style: TextStyle(fontWeight: FontWeight.w500),),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () {}, child: const Text('Book this seat'))
            ],
          ),
        )).then((value) {
          print('broo');
          setState(() {
            _deskController.regionsData[index]['selected'] = !_deskController.regionsData[index]['selected'];
            _deskController.selectedRegionTaps.value = _deskController.regionsData
                .where((data) => data['selected'])
                .map<String>((data) => data['regionTap'])
                .toList();
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amber,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text('Selected: ${_deskController.selectedRegionTaps}'),
      ),
      body: Obx(
        () {
          if (_deskController.imageFile.value != '') {
            return Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Scrollbar(
                  controller: _vertical,
                  thumbVisibility: true,
                  //trackVisibility: true,
                  thickness: 10,
                  radius: const Radius.circular(10),
                  child: Scrollbar(
                    controller: _horizontal,
                    thumbVisibility: true,
                    thickness: 10,
                    radius: const Radius.circular(10),
                    notificationPredicate: (notif) => notif.depth == 1,
                    child: SingleChildScrollView(
                      physics: _deskController.canScroll.value
                          ? const ScrollPhysics()
                          : const NeverScrollableScrollPhysics(),
                      controller: _vertical,
                      child: SingleChildScrollView(
                        physics: _deskController.canScroll.value
                            ? const ScrollPhysics()
                            : const NeverScrollableScrollPhysics(),
                        controller: _horizontal,
                        scrollDirection: Axis.horizontal,
                        child: Listener(
                          onPointerDown: (event) {
                            events.add(event.pointer);
                            print('new event');
                          },
                          onPointerMove: (event) {
                            if (events.length == 2) {
                              // setState(() {
                              //   canScroll = false;
                              //   isSkrolling = true;
                              // });
                              _deskController.canScroll.value = false;
                              _deskController.isSkrolling.value = true;
                            } else {
                              // setState(() {
                              //   isSkrolling = true;
                              // });
                              _deskController.isSkrolling.value = true;
                            }
                          },
                          onPointerUp: (event) {
                            events.clear();
                            print("events cleared");
                            // setState(() {
                            //   canScroll = true;
                            //   isSkrolling = false;
                            // });
                            _deskController.canScroll.value = true;
                            _deskController.isSkrolling.value = false;
                          },
                          child: InteractiveViewer(
                            boundaryMargin: const EdgeInsets.all(0),
                            minScale: 1.0,
                            maxScale: 3.0,
                            child: ImageMap(
                              image: Image.memory(
                                const Base64Decoder().convert(_deskController.imageFile.value),
                                width: _deskController.imageFileWidth.value,
                                height: _deskController.imageFileHeight.value,
                                gaplessPlayback: true,
                              ),
                              // Image.asset('assets/images/floor_layout.jpg',
                              //     width: imageWidth, height: imageHeight), // Replace with your image path.
                              regions: _deskController.regionsData.map<Rect>((data) => data['path']).toList(),
                              onTap: handleRegionTap,
                              status: _deskController.regionsData.map<String>((data) => data['status']).toList(),
                              selectedRegions:
                                  _deskController.regionsData.map<bool>((data) => data['selected']).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Imagedata is Empty'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
