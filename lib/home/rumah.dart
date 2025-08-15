import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/controller/disable_screenshot_controller/disable_screenshot_controller.dart';
import 'package:sandbox_flutter_3/feature/API/home_api_test.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/arjuna_banner.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/arjuna_feature.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/arjuna_notification_revamp_screen.dart';
import 'package:sandbox_flutter_3/feature/Celebreak/main_townsqr.dart';
import 'package:sandbox_flutter_3/feature/PDF/change_pdf.dart';
import 'package:sandbox_flutter_3/feature/PDF/create_pdf.dart';
import 'package:sandbox_flutter_3/feature/PDF/open_pdf.dart';
import 'package:sandbox_flutter_3/feature/contoh_screen.dart';
import 'package:sandbox_flutter_3/feature/dicoding/flutter_pemula_akhir_submission.dart';
import 'package:sandbox_flutter_3/feature/dicoding/flutter_pemula_akhir_submission/screen/news_home.dart';
import 'package:sandbox_flutter_3/feature/draggble_object/main_home_draggable_explore.dart';
import 'package:sandbox_flutter_3/feature/encrypt_data/encrypt_data.dart';
import 'package:sandbox_flutter_3/feature/firestore_example/screen/firestore_example_main_screen.dart';
import 'package:sandbox_flutter_3/feature/grouped_list/grouped_list_first.dart';
import 'package:sandbox_flutter_3/feature/image_mapping/main_image_mapping.dart';
import 'package:sandbox_flutter_3/feature/image_mapping/painter_draw/try_painter_draw_1.dart';
import 'package:sandbox_flutter_3/feature/image_mapping/painter_draw/try_painter_draw_2.dart';
import 'package:sandbox_flutter_3/feature/image_mapping/painter_draw/try_painter_draw_3.dart';
import 'package:sandbox_flutter_3/feature/local_notif/local_notif_screen.dart';
import 'package:sandbox_flutter_3/feature/movie-app/screen/dashboard_movie.dart';
import 'package:sandbox_flutter_3/feature/movie-app/screen/welcome_screen.dart';
import 'package:sandbox_flutter_3/feature/movie_app_second/main_screen.dart';
import 'package:sandbox_flutter_3/feature/open_another_app/open_anotner_app_main.dart';
import 'package:sandbox_flutter_3/feature/other/Trying_Variable/trying_variable.dart';
import 'package:sandbox_flutter_3/feature/camera/basic_camera/basic_camera.dart';
import 'package:sandbox_flutter_3/feature/camera/basic_camera/basic_camera_with_aspect_ratio.dart';
import 'package:sandbox_flutter_3/feature/camera/edge_detector_plus_ocr/edge_detector_ocr.dart';
import 'package:sandbox_flutter_3/feature/camera/main_home_camera_explore.dart';
import 'package:sandbox_flutter_3/feature/camera/mobile_vision_ocr/mobile_vision_ocr.dart';
import 'package:sandbox_flutter_3/feature/other/crop_image/crop_image.dart';
import 'package:sandbox_flutter_3/feature/other/crop_image/testing_offset.dart';
import 'package:sandbox_flutter_3/feature/lazy_load/lazy_load_example.dart';
import 'package:sandbox_flutter_3/feature/push_notif/push_notification_screen.dart';
import 'package:sandbox_flutter_3/feature/push_notif/test_page_notif_1.dart';
import 'package:sandbox_flutter_3/feature/random_code/moveable_main_widget.dart';
import 'package:sandbox_flutter_3/feature/random_code/moveable_overlay.dart';
import 'package:sandbox_flutter_3/feature/save_to_local/save_to_local.dart';
import 'package:sandbox_flutter_3/feature/share_files_sosmed/share_files.dart';
import 'package:sandbox_flutter_3/feature/sqflite/test_sqflite_home.dart';
import 'package:sandbox_flutter_3/feature/table_calendar/table_calendar_example.dart';
import 'package:sandbox_flutter_3/feature/try_getx_worker/tryworker_screen.dart';
import 'package:sandbox_flutter_3/feature/webview/webview_home.dart';
import 'package:sandbox_flutter_3/controller/disable_screenshot_controller/disable_screenshot_controller.dart';
import 'package:sandbox_flutter_3/global_component/main_menu_component.dart';
import 'package:screen_protector/screen_protector.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart';

class Rumah extends StatefulWidget {
  const Rumah({Key? key}) : super(key: key);

  @override
  State<Rumah> createState() => RumahState();
}

class RumahState extends State<Rumah> {
  GlobalKey<RumahState> globalKey = GlobalKey();
  late List<CameraDescription> cameras;

  Offset _offset = const Offset(0, 0);
  double bottomNavBarHeight = kBottomNavigationBarHeight;
  double widgetSize = 50.0;
  double _maxX = 0.0;
  double _maxY = 0.0;
  late double perDuaHeight;
  late double perDuaWidth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cameraList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(kBottomNavigationBarHeight);
      // final screenWidth = MediaQuery.of(context).size.width;
      // final screenHeight = MediaQuery.of(context).size.height;
      // final appBarHeight = AppBar().preferredSize.height;
      // final statusBarHeight = MediaQuery.of(context).padding.top;

      // setState(() {
      //   _maxX = screenWidth - widgetSize;
      //   _maxY = screenHeight - widgetSize - appBarHeight - statusBarHeight - bottomNavBarHeight - 25;

      //   perDuaWidth = screenWidth / 2;
      //   perDuaHeight = screenHeight / 2;
      // });
    });
  }

  cameraList() async {
    cameras = await availableCameras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  MainMenuComponent(toDo: () => Get.to(const SqfliteTestHome()), nameMenu: 'Test SQFLite Home'),
                  MainMenuComponent(toDo: () => Get.to(const MainTownSQR()), nameMenu: 'TownSquare (Cele)'),
                  MainMenuComponent(toDo: () => Get.to(const RumahWebview()), nameMenu: 'Webview'),
                  MainMenuComponent(toDo: () => Get.to(const MainHomeExploreCamera()), nameMenu: 'Try Flutter Camera'),
                  MainMenuComponent(toDo: () => Get.to(PushNotificationScreen()), nameMenu: 'Push Notification'),
                  MainMenuComponent(toDo: () => Get.to(const ArjunaFeature()), nameMenu: 'Arjuna Feature'),
                  MainMenuComponent(toDo: () => Get.to(const LazyLoadExamplePage()), nameMenu: 'Lazy Load'),
                  MainMenuComponent(toDo: () => Get.to(const SaveToLocal()), nameMenu: 'Save to Local'),
                  MainMenuComponent(toDo: () => Get.to(const MainHomeDraggableExplore()), nameMenu: 'Draggable Explore'),
                  MainMenuComponent(toDo: () => Get.to(const TestPageNotifLanding()), nameMenu: 'Notif Landing'),
                  MainMenuComponent(toDo: () => Get.to(const ShowNotification()), nameMenu: 'Local Notifications'),
                  MainMenuComponent(toDo: () => Get.to(const HomeAPITesting()), nameMenu: 'Testing some API'),
                  MainMenuComponent(toDo: () => Get.to(const OpenAnotherAppMain()), nameMenu: 'Open another app'),
                  MainMenuComponent(toDo: () => Get.to(const EnkripsiDdata()), nameMenu: 'Enkripsi Data'),
                  MainMenuComponent(toDo: () => Get.to(const MainImageMappingScreen()), nameMenu: 'Image Mapping'),
                  MainMenuComponent(toDo: () => Get.to(const GroupedListFirst()), nameMenu: 'Try Grouped List'),
                  MainMenuComponent(toDo: () => Get.to(const ContohScreen()), nameMenu: 'Json from File'),
                  MainMenuComponent(toDo: () => Get.to(OpenPdfFile()), nameMenu: 'Change PDF'),
                  MainMenuComponent(toDo: () => Get.to(const HomeNews()), nameMenu: 'Dicoding'),
                  MainMenuComponent(toDo: () => Get.to(const TryWorkerScreen()), nameMenu: 'Try Worker'),
                  MainMenuComponent(toDo: () => ScreenProtector.preventScreenshotOn(), nameMenu: 'Enable Screenshoot prevention'),
                  MainMenuComponent(toDo: () => ScreenProtector.preventScreenshotOff(), nameMenu: 'Disable Screenshoot Prevention'),
                  MainMenuComponent(toDo: () => Get.to(const DashboardMovies()), nameMenu: 'Movie App'),
                  MainMenuComponent(toDo: () => Get.to(const FirestoreMainHome()), nameMenu: 'Firestore Example'),
                  MainMenuComponent(toDo: () => Get.to(TableCalendarExample()), nameMenu: 'Table Calendar Example'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeController extends GetxController with WidgetsBindingObserver {
  RxString status = ''.obs;

  @override
  void onInit() async {
    await getNotifPermissionStatus();
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      print('resumed');
      var x = await Permission.notification.status;
      if (x.isGranted) {
        status.value = 'got-it';
      }
      print('apakah-$x');
    } else if (state == AppLifecycleState.paused) {
      print('paused');
    }
  }

  Future<void> getNotifPermissionStatus() async {
    var x = await Permission.notification.status;
    if (x.isDenied || x.isPermanentlyDenied) {
      Get.bottomSheet(
        Obx((() {
          if (status.value == 'got-it') {
            getBackFunc();
          }
          return Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  status.value != 'got-it' ? const Text('Please turn on your notification permission') : const Text('Permission Granted'),
                  status.value != 'got-it'
                      ? ElevatedButton(
                          onPressed: () {
                            openAppSettings();
                            //Get.back();
                          },
                          child: const Text('Open Setting'),
                        )
                      : Container()
                ],
              ),
            ),
          );
        })),
        isDismissible: false,
      );
    }
    print('woy-ah : $x');
  }

  getBackFunc() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.back();
  }
}
