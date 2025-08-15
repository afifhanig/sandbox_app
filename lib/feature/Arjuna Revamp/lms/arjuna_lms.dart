import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sandbox_flutter_3/controller/arjuna/lms_controller.dart';
import 'package:sandbox_flutter_3/feature/Arjuna%20Revamp/lms/arjuna_all_training_catalog.dart';

class ArjunaLMS extends StatefulWidget {
  const ArjunaLMS({super.key});

  @override
  State<ArjunaLMS> createState() => _ArjunaLMSState();
}

class _ArjunaLMSState extends State<ArjunaLMS> {
  late LMSController _lmsController;

  @override
  void initState() {
    // TODO: implement initState
    _lmsController = Get.put(LMSController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ARJUNA LMS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getMyTask(),
            getMyJourney(),
            const SizedBox(height: 10),
            SizedBox(height: 100, child: getMandatoryCatalog()),
            Expanded(child: getNearestTraining()),
          ],
        ),
      ),
    );
  }

  Widget getMyTask() {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx((() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Training Invitation'), Text('${_lmsController.trainingInvitation.value}')],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Pending Request'), Text('${_lmsController.pendingRequest.value}')],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Pending Approval'), Text('${_lmsController.pendingApproval.value}')],
                  )
                ],
              );
            }))),
      ),
    );
  }

  Widget getMyJourney() {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx((() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Completed'), Text('${_lmsController.journeyCompleted.value}')],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Not Complete'), Text('${_lmsController.journeyNotCompleted.value}')],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('On Schedule'), Text('${_lmsController.journeyOnScheduled.value}')],
                  )
                ],
              );
            }))),
      ),
    );
  }

  Widget getMandatoryCatalog() {
    return Obx((() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Mandatory Catalog'),
              InkWell(
                  onTap: () {
                    _lmsController.getAllCatalogTraining();
                  },
                  child: const Text('See All Catalog')),
            ],
          ),
          _lmsController.mandatoryCatalog.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _lmsController.mandatoryCatalog.length,
                      itemBuilder: ((context, index) {
                        return SizedBox(
                          width: 150,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_lmsController.mandatoryCatalog[index].trainingName),
                                Text(_lmsController.mandatoryCatalog[index].startDate),
                                Text(_lmsController.mandatoryCatalog[index].location),
                              ],
                            ),
                          ),
                        );
                      })),
                )
              : Container(
                  child: Text('Empty'),
                )
        ],
      );
    }));
  }

  Widget getNearestTraining() {
    return Obx((() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Nearest Training'),
          _lmsController.nearestTraining.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _lmsController.mandatoryCatalog.length,
                      itemBuilder: ((context, index) {
                        return SizedBox(
                          width: 150,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_lmsController.nearestTraining[index].trainingName),
                                Text(_lmsController.nearestTraining[index].startDate),
                                Text(_lmsController.nearestTraining[index].location),
                              ],
                            ),
                          ),
                        );
                      })),
                )
              : Container(
                  child: Text('Empty'),
                )
        ],
      );
    }));
  }
}
