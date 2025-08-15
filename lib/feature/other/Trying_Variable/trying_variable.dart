import 'package:flutter/material.dart';

class TryingVariable extends StatefulWidget {
  const TryingVariable({super.key});

  @override
  State<TryingVariable> createState() => _TryingVariableState();
}

class _TryingVariableState extends State<TryingVariable> {
  Set setSatu = <dynamic>{};
  var setGorengan = {'bakwan', 'cireng', 'ubi', 'risol', 'cilokk'};
  var setGorenganDua = {'cireng', 'cilok', 'batagor'};
  Set setDataPribadi = <DataPribadi>{};
  var unionSet;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('datanya : $unionSet'),
          ElevatedButton(
              onPressed: () {
                setSatu.add(1);
                setGorengan.add('tempe');
                // setSatu.add('satu');
                // setSatu.add(2);
                // setSatu.add(3);
                // setSatu.add(4);
                // print('added');
                // setState(() {
                //   unionSet = setGorengan.union(setGorenganDua);
                // });
                setDataPribadi.add(DataPribadi(nama: 'Agus', asal: 'Bandung'));
                setDataPribadi.add(DataPribadi(nama: 'Agus', asal: 'Bandung'));
                setDataPribadi.add(DataPribadi(nama: 'Agus', asal: 'Jakarta'));
                setDataPribadi.add(DataPribadi(nama: 'Baldi', asal: 'Tangerang'));
                print('added');
              },
              child: Text('Add Set')),
          SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                print(setDataPribadi.length);
                print(setDataPribadi);
                print(setDataPribadi.elementAt(0).hashCode);
                //print(setDataPribadi.elementAt(1).hashCode);
                print('------');
                // print(setSatu.length);
                // print(setSatu);
                // print('------');
                // print(setGorengan.length);
                // print(setGorengan);
                // setDataPribadi.forEach((element) {
                //   debugPrint(element.toString());
                // });
                // print(setSatu.length);
                // setSatu.forEach((element) {
                //   print(element);
                // });
              },
              child: Text('Print Set'))
        ],
      )),
    );
  }
}

class DataPribadi {
  late String nama;
  late String asal;

  @override
  bool operator ==(Object other) {
    return (other is DataPribadi) && other.nama == nama && other.asal == asal;
  }

  @override
  int get hashCode => Object.hash(nama.hashCode, asal.hashCode);

  DataPribadi({required this.nama, required this.asal});
}
