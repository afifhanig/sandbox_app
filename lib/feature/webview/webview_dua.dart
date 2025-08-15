import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WebviewDua extends StatefulWidget {
  const WebviewDua({super.key});

  @override
  State<WebviewDua> createState() => _WebviewDuaState();
}

class _WebviewDuaState extends State<WebviewDua> with WidgetsBindingObserver {
  late InAppWebViewController inAppWebViewController;
  double _progress = 0;
  bool isFullScreen = false;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      if (state == AppLifecycleState.resumed) {
        debugPrint('foreground');
        debugPrint(isFullScreen ? 'yes its on fullscreen' : 'no fullscreen');
      } else if (state == AppLifecycleState.paused) {
        debugPrint('background');
        debugPrint(isFullScreen ? 'yes its on fullscreen' : 'no fullscreen');
      }
    });
    // TODO: implement didChangeAppLifecycleState
  }

  _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [const Text('Webview Dua'), Text(' || $_progress')],
        ),
      ),
      body: SizedBox(
        // height: double.infinity,
        // width: double.infinity,
        child: Column(
          children: [
            if (_progress < 1)
              LinearProgressIndicator(
                color: Colors.red,
                value: _progress / 1.0,
              ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(0.0),
                decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Stack(
                  children: [
                    InAppWebView(
                      initialUrlRequest: URLRequest(url: Uri.parse("https://www.google.com/")),
                      initialOptions: InAppWebViewGroupOptions(
                        crossPlatform: InAppWebViewOptions(
                          useShouldOverrideUrlLoading: true,
                          mediaPlaybackRequiresUserGesture: false,
                        ),
                        android: AndroidInAppWebViewOptions(
                          useHybridComposition: true,
                        ),
                        ios: IOSInAppWebViewOptions(
                          allowsInlineMediaPlayback: true,
                        ),
                      ),
                      onWebViewCreated: (InAppWebViewController controller) {
                        inAppWebViewController = controller;
                      },
                      onProgressChanged: (InAppWebViewController controller, int progress) {
                        setState(() {
                          _progress = progress / 100;
                        });
                      },
                      onEnterFullscreen: (controller) {
                        print('fullskrin');
                        setState(() {
                          isFullScreen = true;
                        });
                      },
                      onExitFullscreen: (controller) {
                        print('exit fullskrin');
                        setState(() {
                          isFullScreen = false;
                        });
                      },
                      shouldOverrideUrlLoading: (controller, navigationAction) {
                        print('woy => ${navigationAction.request.url.toString().contains('downloads') ? 'yes' : 'no'}');
                        if (navigationAction.request.url.toString().contains('downloads')) {
                          _launchURL(navigationAction.request.url!);
                        }
                        return Future.value(NavigationActionPolicy.ALLOW);
                      },
                      onDownloadStartRequest: (controller, downloadStartRequest) {
                        print("woy22 => ${downloadStartRequest}");
                      },
                      onLoadError: (controller, url, code, message) {
                        print('masihdisini');
                      },
                      onWindowFocus: (controller) {
                        print('masihdisini');
                      },
                    ),
                    Listener(
                      behavior: HitTestBehavior.translucent,
                      onPointerDown: (event) => print('testing1 ${DateTime.now()}'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
