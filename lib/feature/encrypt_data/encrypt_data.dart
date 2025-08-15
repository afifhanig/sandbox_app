import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/feature/encrypt_data/encrypt_aes.dart';

class EnkripsiDdata extends StatefulWidget {
  const EnkripsiDdata({super.key});

  @override
  State<EnkripsiDdata> createState() => _EnkripsiDdataState();
}

class _EnkripsiDdataState extends State<EnkripsiDdata> {
  String dateTerenkripsi = '';
  String dataTidakTerenkripsi = '';
  TextEditingController stringToEnkrip = TextEditingController();
  bool _textFieldIsEmpty = false;

  encryptData256() {
    var x = encryptAESCryptoJS(stringToEnkrip.text, 'sekrekt');
    setState(() {
      dateTerenkripsi = x;
    });
    debugPrint(x.length.toString());
    debugPrint(x);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enskripsi data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: stringToEnkrip,
                decoration: InputDecoration(
                  labelText: 'String to Encrypt',
                  errorText: _textFieldIsEmpty ? 'TextField Cannot Be Empty' : null,
                  errorMaxLines: 2,
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 1, color: Colors.blue),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                      )),
                  errorBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(width: 1, color: Colors.red)),
                  focusedErrorBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(width: 1, color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // if (stringToEnkrip.text != '' || stringToEnkrip.text.isNotEmpty) {
                  //   encryptData256();
                  //   _textFieldIsEmpty = false;
                  // } else {
                  //   setState(() {
                  //     _textFieldIsEmpty = true;
                  //   });
                  // }
                  List<List<String>> cacheEntries = [
                    ["12:30:22", "a2er5i80", "125"],
                    ["09:07:47", "io09ju56", "341"],
                    ["01:23:09", "a2er5i80", "764"]
                  ];

                  List<List<String>> queries = [
                    ["a2er5i80", "01:23:09"],
                    ["io09ju56", "09:07:47"]
                  ];

                  List<int> result = hackerrankOne(cacheEntries, queries);
                  print(result); // Output: [764, 341]
                },
                child: const Text('Encrypt It!'),
              ),
              const SizedBox(height: 10),
              Text(dateTerenkripsi),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    dataTidakTerenkripsi = decryptAESCryptoJS(dateTerenkripsi, 'sekrekt');
                  });
                },
                child: const Text('Decrypt It!'),
              ),
              Text(dataTidakTerenkripsi),
            ],
          ),
        ),
      ),
    );
  }

  int hackerrankTwo(List<int> ids, int m) {
    // Count the occurrences of each ID
    var idCount = HashMap<int, int>();
    for (var id in ids) {
      idCount.update(id, (value) => value + 1, ifAbsent: () => 1);
    }

    // Convert the counts to a list and sort by frequency in ascending order
    var counts = idCount.values.toList();
    counts.sort();

    int removedItems = 0;
    int differentIDs = idCount.length;

    for (var count in counts) {
      if (removedItems + count <= m) {
        removedItems += count;
        differentIDs--;
      } else {
        break;
      }
    }

    return differentIDs;
  }

  List<int> hackerrankOne(List<List<String>> cacheEntries, List<List<String>> queries) {
    // Create a map to store the cache entries with their keys and timestamps
    var cacheMap = <String, Map<String, String>>{};

    // Populate the cache map
    for (var entry in cacheEntries) {
      var timestamp = entry[0];
      var key = entry[1];
      var value = entry[2];

      if (!cacheMap.containsKey(key)) {
        cacheMap[key] = <String, String>{};
      }

      cacheMap[key]![timestamp] = value;
    }

    // Process the queries
    var results = <int>[];

    for (var query in queries) {
      var key = query[0];
      var timestamp = query[1];

      // Check if the key exists and the timestamp exists for that key
      if (cacheMap.containsKey(key) && cacheMap[key]!.containsKey(timestamp)) {
        results.add(int.parse(cacheMap[key]![timestamp]!));
      } else {
        results.add(-1); // Or some default value if not found
      }
    }

    return results;
  }
}
