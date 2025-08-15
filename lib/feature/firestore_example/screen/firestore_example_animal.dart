// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sandbox_flutter_3/feature/firestore_example/controller/firestore_controller.dart';
// import 'package:sandbox_flutter_3/feature/firestore_example/model/bintarang_model.dart';

// class FirestoreAnimalExample extends StatefulWidget {
//   const FirestoreAnimalExample({super.key});

//   @override
//   State<FirestoreAnimalExample> createState() => _FirestoreMainHomeState();
// }

// class _FirestoreMainHomeState extends State<FirestoreAnimalExample> {
//   final FirestoreController firestoreController = Get.put(FirestoreController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Binatangs")),
//       body: Obx(() {
//         if (firestoreController.binatangsList.isEmpty) {
//           return Center(child: CircularProgressIndicator());
//         } else {
//           return ListView.builder(
//             itemCount: firestoreController.binatangsList.length,
//             itemBuilder: (context, index) {
//               BinatangModel binatang = firestoreController.binatangsList[index];
//               return ListTile(
//                 title: Text(binatang.nama),
//                 subtitle: Text("Habitat: ${binatang.habitat}"),
//                 trailing: Text("Jumlah: ${binatang.jumlah}"),
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }

// class WidgetListBinatang extends StatelessWidget {
//   const WidgetListBinatang({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference<BinatangModel> binatangs = FirebaseFirestore.instance.collection("binatang").withConverter<BinatangModel>(
//           fromFirestore: (snapshots, _) => BinatangModel.fromJson(snapshots.data()!),
//           toFirestore: (binatang, _) => binatang.toJson(),
//         );

//     return StreamBuilder<QuerySnapshot<BinatangModel>>(
//         stream: binatangs.snapshots(),
//         builder: (contextStream, snapshotStream) {
//           if (snapshotStream.connectionState == ConnectionState.active) {
//             return ListView(
//               children: List<Widget>.generate(snapshotStream.data!.size, (index) => ItemBinatang(binatang: snapshotStream.data!.docs[index].data())),
//             );
//           }

//           if (snapshotStream.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           return WidgetNotification(message: "Terdapat kesalahan dalam pengambilan data");
//         });
//   }
// }

// class ItemBinatang extends StatelessWidget {
//   final BinatangModel binatang;
//   const ItemBinatang({Key? key, required this.binatang}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 10),
//       decoration: BoxDecoration(),
//       child: Row(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 this.binatang.nama,
//                 style: TextStyle(
//                   color: Colors.black87,
//                   fontSize: 18,
//                   letterSpacing: 1.3,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 this.binatang.habitat,
//                 style: TextStyle(
//                   color: Colors.black45,
//                   fontSize: 11,
//                   letterSpacing: 0.3,
//                 ),
//               )
//             ],
//           ),
//           Expanded(
//               child: Container(
//             alignment: Alignment.centerRight,
//             child: Text(
//               this.binatang.jumlah.toString(),
//               style: TextStyle(
//                 color: Colors.black87,
//                 fontSize: 18,
//               ),
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }

// class WidgetNotification extends StatelessWidget {
//   final String message;

//   const WidgetNotification({Key? key, required this.message}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(this.message),
//         ],
//       ),
//     );
//   }
// }
