import 'package:flutter/material.dart';

class ArjunaBannerRevamp extends StatefulWidget {
  const ArjunaBannerRevamp({super.key});

  @override
  State<ArjunaBannerRevamp> createState() => _ArjunaBannerRevampState();
}

class _ArjunaBannerRevampState extends State<ArjunaBannerRevamp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arjuna Banner Revamp'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SizedBox(
            width: double.infinity,
            height: 120,
            child: 
            Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              color: Colors.white,
              child:
               Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Card(
                          margin: EdgeInsets.zero,
                          clipBehavior: Clip.hardEdge,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            'assets/images/city.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Check Tanggal Merah 2023',
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              '04/11/2022  09:00',
                              style: TextStyle(fontSize: 12),
                            ),
                            // Align(
                            //   alignment: Alignment.bottomRight,
                            //   child:
                            // )
                            const Spacer(),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                child: const Text(
                                  'Show Info',
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.red,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
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
        ),
      ),
    );
  }
}
