import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

class OpenAnotherAppMain extends StatelessWidget {
  const OpenAnotherAppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open the other App'),
      ),
      body: Center(
        child: Column( 
          children: [
            ElevatedButton(
              onPressed: () async {
                await LaunchApp.openApp(
                  androidPackageName: 'com.appsfoundry.eperpuswl.id.cimbrary',
                  iosUrlScheme: 'pulsesecure://',
                  appStoreLink: 'itms-apps://itunes.apple.com/us/app/pulse-secure/id945832041'
                );
              },
              child: const Text('Open App'),
            )
          ],
        ),
      ),
    );
  }
}
