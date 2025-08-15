import 'package:flutter/material.dart';

class ChangeWfhAddress extends StatefulWidget {
  const ChangeWfhAddress({super.key});

  @override
  State<ChangeWfhAddress> createState() => _ChangeWfhAddressState();
}

class _ChangeWfhAddressState extends State<ChangeWfhAddress> {
  final TextEditingController _ctrlText = TextEditingController(
      text: 'Jl. Swadaya No.56 A, Pd. Pucung, Kec. Pd. Aren, Kota Tangerang Selatan, Banten 15229');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Wfh Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Your WFH Address :', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: TextField(
                style: TextStyle(color: Colors.grey),
                controller: _ctrlText,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  enabled: false,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Change WFH Address'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
