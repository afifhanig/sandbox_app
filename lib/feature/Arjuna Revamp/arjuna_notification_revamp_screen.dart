import 'package:flutter/material.dart';

class ArjunaNotificationRevampScreen extends StatefulWidget {
  const ArjunaNotificationRevampScreen({super.key});

  @override
  State<ArjunaNotificationRevampScreen> createState() => _ArjunaNotificationRevampScreenState();
}

class _ArjunaNotificationRevampScreenState extends State<ArjunaNotificationRevampScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.red.shade400,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              cardNotif(Icons.location_pin, 'Booking Request',
                  'Your Meeting Room in SASANDO is succesfully booked.\nDon\'t forget to check in'),
              cardNotif(Icons.computer, 'Staff Loan',
                  'Staff_123 requested your approval fot Staff Loan.\nDon\'t forget to check document'),
              cardNotif(Icons.lock_outline, 'Change Password',
                  'Your password is successfully changedddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd'),
            ],
          ),
          // ListView.builder(
          //   shrinkWrap: true,
          //   //primary: false,
          //   itemCount: 5,
          //   itemBuilder: ((context, index) {
          //     return Card(
          //       child: Text('data'),
          //     );
          //   }),
          // ),
        ),
      ),
    );
  }

  // Column(
  //   children: [
  //     cardNotif(Icons.location_pin, 'Booking Request', 'Your Meeting Room in SASANDO is succesfully booked.\nDon\'t forget to check in'),
  //     cardNotif(Icons.computer, 'Staff Loan', 'Staff_123 requested your approval fot Staff Loan.\nDon\'t forget to check document'),
  //     cardNotif(Icons.lock_outline, 'Change Password', 'Your password is successfully changed'),
  //   ],
  // ),

  Widget cardNotif(IconData theIcon, String titleMessage, String bodyMessage) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 30, 10),
          child:
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Container(
              //       color: Colors.transparent,
              //       child: Row(
              //         children: [
              //           Icon(
              //             theIcon,
              //             size: 30,
              //           ),
              //           SizedBox(
              //             width: 10,
              //           ),
              //           Text(
              //             titleMessage,
              //             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //           ),
              //         ],
              //       ),
              //     ),
              //     Spacer(),
              //     Container(
              //       color: Colors.transparent,
              //       child: Row(
              //         children: [
              //           SizedBox(
              //             width: 40,
              //           ),
              //           Expanded(
              //             child: Text(
              //               bodyMessage,
              //               style: const TextStyle(fontSize: 16),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     const Spacer(),
              //     Align(
              //       alignment: Alignment.bottomRight,
              //       child: Container(
              //         color: Colors.transparent,
              //         child: const Text('04/11/2022  09:00'),
              //       ),
              //     ),
              //   ],
              // )
              Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Icon(
                          theIcon,
                          size: 30,
                        ),
                      ),
                    ),
                    Expanded(flex: 3, child: Container(color: Colors.transparent)),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        color: Colors.transparent,
                        child: Text(
                          titleMessage,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        color: Colors.transparent,
                        child: Text(
                          bodyMessage,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        color: Colors.transparent,
                        child: Text('04/11/2022  09:00'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
