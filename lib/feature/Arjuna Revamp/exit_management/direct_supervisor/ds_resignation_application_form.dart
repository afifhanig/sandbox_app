import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/component/arjuna_appbar.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/component/confirmation_dialog.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/exit_management/employee/resignation_success_screen.dart';

class DSResignationApplicationForm extends StatefulWidget {
  const DSResignationApplicationForm({super.key});

  @override
  State<DSResignationApplicationForm> createState() => _ResignationApplicationState();
}

class _ResignationApplicationState extends State<DSResignationApplicationForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: ArjunaAppBar(
          label: "Resignation",
          centerTitle: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Resignation Application',
                style: TextStyle(fontSize: 22, color: Colors.red[800], fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text('Resignation Notification Date', style: TextStyle(color: Colors.grey)),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: '13/04/2024',
                    hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                    contentPadding: const EdgeInsets.fromLTRB(8.0, 2.0, 2.0, 8.0),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Effective Resignation Date'),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            title: Text(
                              'This is date picker',
                              textAlign: TextAlign.center,
                            ),
                          );
                        });
                  },
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'dd/mm/yy',
                      hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                      enabled: false,
                      contentPadding: const EdgeInsets.fromLTRB(8.0, 2.0, 2.0, 8.0),
                      suffixIcon: const Icon(Icons.date_range_outlined),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Phone Number', style: TextStyle(color: Colors.grey)),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: 'Input Number',
                    hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                    contentPadding: const EdgeInsets.fromLTRB(8.0, 2.0, 2.0, 8.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Personal Email Address', style: TextStyle(color: Colors.grey)),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: 'Input Text',
                    hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                    contentPadding: const EdgeInsets.fromLTRB(8.0, 2.0, 2.0, 8.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Leaving Reason', style: TextStyle(color: Colors.grey)),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: 'Select Option',
                    hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                    contentPadding: const EdgeInsets.fromLTRB(8.0, 2.0, 2.0, 8.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                  ),
                  value: null, // Set the default value (null if no value is selected initially)
                  items: <String>['Leaving Reason 1', 'Leaving Reason 2', 'Leaving Reason 3'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Handle the dropdown value change
                    print(newValue);
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text('Reason Detail'),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: 'Select Option',
                    hintStyle: const TextStyle(fontStyle: FontStyle.italic),
                    contentPadding: const EdgeInsets.fromLTRB(8.0, 2.0, 2.0, 8.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                  ),
                  value: null, // Set the default value (null if no value is selected initially)
                  items: <String>['Reason Detail 1', 'Reason Detail 2', 'Reason Detail 3'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Handle the dropdown value change
                    print(newValue);
                  },
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 8.0)),
              const SizedBox(height: 20),
              Text(
                'Resignation Letter',
                style: TextStyle(fontSize: 22, color: Colors.red[800], fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 85,
                          width: 85,
                          color: Colors.grey,
                          child: const Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.photo_camera_outlined,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: SizedBox(
                            height: 85,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Resignation Letter', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Colors.red.shade700,
                                            ),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          'Upload',
                                          style: TextStyle(color: Colors.red.shade700),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: Colors.red.shade700,
                                            ),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Icon(Icons.delete_outline_rounded, color: Colors.red.shade700)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Notes (Optional)',
                style: TextStyle(fontSize: 22, color: Colors.red[800], fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  minLines: 4,
                  maxLines: 6,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8.0),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Notes',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.red.shade100, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.red.shade700)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'To facilitate the exit process, please read the \n guidelines beforehand. ',
                      style: TextStyle(color: Colors.red.shade700), // Default text style
                      children: [
                        TextSpan(
                          text: 'Read the guidelines',
                          style: TextStyle(color: Colors.red.shade800, decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Add your desired action here, like navigating to another page
                              print("Read the guidelines clicked");
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    attentionPopUp();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  attentionPopUp() {
    Get.dialog(
      ConfirmationDialog(
        title: 'Attention',
        subTitle: 'Please ensure the data that you have entered is correct',
        onClickPositive: () {
          Get.to(ResignationSuccessScreen());
        },
        textButtonPositive: 'Confirm',
        onClickNegative: () {
          Get.back();
        },
        textButtonNegative: 'Cancel',
      ),
    );
  }
}
