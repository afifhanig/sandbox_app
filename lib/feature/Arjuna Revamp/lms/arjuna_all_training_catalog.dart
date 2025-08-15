import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandbox_flutter_3/controller/arjuna/lms_controller.dart';

class AllCatalogTrainingScreen extends StatefulWidget {
  const AllCatalogTrainingScreen({super.key});

  @override
  State<AllCatalogTrainingScreen> createState() => _AllCatalogTrainingScreenState();
}

class _AllCatalogTrainingScreenState extends State<AllCatalogTrainingScreen> {
  late LMSController _lmsController;

  @override
  void initState() {
    // TODO: implement initState
    _lmsController = Get.find<LMSController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Training Catalog'),
      ),
      body: Column(
        children: [
          Text('Training List'),
          Expanded(
              child: ListView.builder(
                  itemCount: _lmsController.allTrainingCatalogList.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${_lmsController.allTrainingCatalogList[index].id}'),
                                Text('${_lmsController.allTrainingCatalogList[index].trainingName}'),
                                Text('${_lmsController.allTrainingCatalogList[index].startDate}'),
                                Text('${_lmsController.allTrainingCatalogList[index].location}'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })))
        ],
      ),
    );
  }
}
